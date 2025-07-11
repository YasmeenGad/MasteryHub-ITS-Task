import 'dart:io';
import 'package:dio/dio.dart';
import 'error_model.dart';

class ApiErrorHandler {
  final String errorMessage;

  ApiErrorHandler(this.errorMessage);

  static ErrorModel handle(Exception error) {
    if (error is DioException) {
      return ApiErrorHandler.networkError(error, error.response?.statusCode);
    } else if (error is IOException) {
      return const ErrorModel(
        code: 0,
        message: "No internet connection. Please check your settings.",
      );
    } else {
      return const ErrorModel(
        code: 0,
        message: "An unknown error occurred. Please try again.",
      );
    }
  }

  static ErrorModel serverError(int? statusCode, ErrorModel response) {
    final fallbackMessage = response.message ??
        (response.errors?.isNotEmpty == true
            ? response.errors!.first.message
            : "An error occurred");

    switch (statusCode) {
      case 400:
        return ErrorModel(code: 400, message: fallbackMessage);
      case 401:
      case 402:
      case 403:
      case 404:
        return ErrorModel(code: statusCode, message: fallbackMessage);
      case 408:
        return const ErrorModel(
            code: 408,
            message:
                "Connection timed out. Please check your internet connection.");
      case 409:
        return ErrorModel(code: 409, message: fallbackMessage);
      default:
        return ErrorModel(
            code: statusCode ?? 0,
            message: fallbackMessage ??
                "An unexpected error occurred. Please try again.");
    }
  }

  static ErrorModel networkError(DioException error, int? statusCode) {
    switch (statusCode) {
      case 500:
        return const ErrorModel(
            code: 500,
            message: "Internal server error. Please try again later.");
      case 502:
        return const ErrorModel(
            code: 502,
            message: "Bad Gateway. The server received an invalid response.");
      case 503:
        return const ErrorModel(
            code: 503,
            message:
                "Service Unavailable. The server is currently unable to handle the request.");
      case 504:
        return const ErrorModel(
            code: 504,
            message: "Gateway Timeout. The server took too long to respond.");
      default:
        if (error.response?.data is Map<String, dynamic>) {
          final errorModel =
              ErrorModel.fromMap(error.response!.data as Map<String, dynamic>);
          return ApiErrorHandler.serverError(
              error.response?.statusCode, errorModel);
        }
        return const ErrorModel(
            code: 0,
            message: "An unexpected error occurred. Please try again.");
    }
  }
}
