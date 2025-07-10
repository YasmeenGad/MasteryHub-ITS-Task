class ReviewEntity {
  final String reviewId;
  final String userId;
  final String bookId;
  final String comment;
  final double rating;
  final DateTime createdAt;

  const ReviewEntity({
    required this.reviewId,
    required this.userId,
    required this.bookId,
    required this.comment,
    required this.rating,
    required this.createdAt,
  });
}
