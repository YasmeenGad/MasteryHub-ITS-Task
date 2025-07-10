import 'dart:io';
import 'package:dio/dio.dart' hide DioMediaType;
import 'package:injectable/injectable.dart';
import 'package:mastery_hub_its_task/features/home/data/models/response/get_books_response_dto.dart';
import 'package:mastery_hub_its_task/features/search/data/models/response/search_response_dto.dart';
import 'package:retrofit/http.dart';
import 'api_constants.dart';
import 'package:retrofit/error_logger.dart';

part 'api_manager.g.dart';

@singleton
@injectable
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiManager {
  @factoryMethod
  factory ApiManager(Dio dio) = _ApiManager;

  @GET(ApiConstants.getBooks)
  Future<GetBooksResponseDto> getBooks();

  @GET(ApiConstants.search)
  Future<SearchResponseDto> search(@Query("q") String query);
}
