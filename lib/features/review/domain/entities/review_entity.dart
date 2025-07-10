class ReviewEntity {
  final String bookId;
  final String userId;
  final double rating;
  final String comment;
  final DateTime timestamp;

  const ReviewEntity({
    required this.bookId,
    required this.userId,
    required this.rating,
    required this.comment,
    required this.timestamp,
  });
}
