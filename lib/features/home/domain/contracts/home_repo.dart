import 'package:mastery_hub_its_task/core/networking/common/api_result.dart';
import 'package:mastery_hub_its_task/features/home/domain/entities/response/get_books_response_entity.dart';

abstract class HomeRepo {
  Future<DataResult<GetBooksResponseEntity>> getBooks();
}
