import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../contracts/review_repo.dart';
import '../entities/review_entity.dart';

@injectable
class GetBookReviewsUseCase {
  final ReviewRepo _repo;

  const GetBookReviewsUseCase(this._repo);

  Future<DataResult<List<ReviewEntity>>> call(String bookId) async =>
      await _repo.getReviewsForBook(bookId);
}
