import 'package:mastery_hub_its_task/features/home/domain/entities/response/get_books_response_entity.dart';

import '../../../../../../core/networking/common/api_result.dart';

abstract class GetBooksOnlineDataSource {
  Future<DataResult<GetBooksResponseEntity>> getBooks();
}