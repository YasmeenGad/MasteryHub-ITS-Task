import 'package:firebase_auth/firebase_auth.dart';
import 'error_model.dart';

class FirebaseErrorHandler {
  static ErrorModel handle(Exception error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'invalid-email':
          return const ErrorModel(
              message: "The email address is badly formatted.");
        case 'user-disabled':
          return const ErrorModel(message: "This user has been disabled.");
        case 'user-not-found':
          return const ErrorModel(message: "No user found with this email.");
        case 'wrong-password':
          return const ErrorModel(
              message: "Incorrect password. Please try again.");
        case 'email-already-in-use':
          return const ErrorModel(message: "This email is already registered.");
        case 'weak-password':
          return const ErrorModel(message: "Password is too weak.");
        case 'operation-not-allowed':
          return const ErrorModel(
              message: "Operation not allowed. Please contact support.");
        default:
          return ErrorModel(
              message: error.message ?? "Something went wrong. Try again.");
      }
    } else {
      return const ErrorModel(
          message: "An unknown error occurred. Please try again.");
    }
  }
}
