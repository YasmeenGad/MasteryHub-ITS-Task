import '../../domain/entities/review_entity.dart';

sealed class ReviewAction {}

class AddReview extends ReviewAction {
  final ReviewEntity review;

  AddReview(this.review);
}

class GetBookReviews extends ReviewAction {
  final String bookId;

  GetBookReviews(this.bookId);
}
