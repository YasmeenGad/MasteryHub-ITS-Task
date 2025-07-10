import '../../../../../../core/networking/common/api_result.dart';
import '../../../../domain/entities/review_entity.dart';

abstract class ReviewOnlineDataSource {
  Future<DataResult<void>> addReview(ReviewEntity review);

  Future<DataResult<List<ReviewEntity>>> getReviewsForBook(String bookId);
}
