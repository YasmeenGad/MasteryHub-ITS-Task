import '../../domain/entities/review_entity.dart';
import '../models/review_model.dart';

class ReviewMapper {
  static ReviewEntity toEntity(ReviewModel model) {
    return ReviewEntity(
      reviewId: model.reviewId,
      userId: model.userId,
      bookId: model.bookId,
      comment: model.comment,
      rating: model.rating,
      createdAt: model.createdAt,
    );
  }

  static ReviewModel toModel(ReviewEntity entity) {
    return ReviewModel(
      reviewId: entity.reviewId,
      userId: entity.userId,
      bookId: entity.bookId,
      comment: entity.comment,
      rating: entity.rating,
      createdAt: entity.createdAt,
    );
  }
}
