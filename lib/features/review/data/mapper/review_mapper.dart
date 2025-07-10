import '../../domain/entities/review_entity.dart';
import '../models/review_model.dart';

class ReviewMapper {
  static ReviewEntity toEntity(ReviewModel model) => ReviewEntity(
        bookId: model.bookId,
        userId: model.userId,
        rating: model.rating,
        comment: model.comment,
        timestamp: model.timestamp,
      );

  static ReviewModel toModel(ReviewEntity entity) => ReviewModel(
        bookId: entity.bookId,
        userId: entity.userId,
        rating: entity.rating,
        comment: entity.comment,
        timestamp: entity.timestamp,
      );
}
