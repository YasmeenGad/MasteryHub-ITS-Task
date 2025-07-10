class ReviewModel {
  final String reviewId;
  final String userId;
  final String bookId;
  final String comment;
  final double rating;
  final DateTime createdAt;

  const ReviewModel({
    required this.reviewId,
    required this.userId,
    required this.bookId,
    required this.comment,
    required this.rating,
    required this.createdAt,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      reviewId: json['reviewId'],
      userId: json['userId'],
      bookId: json['bookId'],
      comment: json['comment'],
      rating: (json['rating'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reviewId': reviewId,
      'userId': userId,
      'bookId': bookId,
      'comment': comment,
      'rating': rating,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
