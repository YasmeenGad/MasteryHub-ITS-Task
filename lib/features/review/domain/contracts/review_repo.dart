import '../../../../core/networking/common/api_result.dart';
import '../entities/review_entity.dart';

abstract class ReviewRepo {
  Future<DataResult<void>> addReview(ReviewEntity review);

  Future<DataResult<List<ReviewEntity>>> getReviewsForBook(String bookId);
}
