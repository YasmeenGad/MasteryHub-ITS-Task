import '../../../../../../core/networking/common/api_result.dart';
import '../../../models/response/get_books_response_dto.dart';

abstract class GetBooksOnlineDataSource {
  Future<DataResult<GetBooksResponseDto>> getBooks();
}