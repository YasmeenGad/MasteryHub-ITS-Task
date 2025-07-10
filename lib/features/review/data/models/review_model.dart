class ReviewModel {
  final String bookId;
  final String userId;
  final double rating;
  final String comment;
  final DateTime timestamp;

  const ReviewModel({
    required this.bookId,
    required this.userId,
    required this.rating,
    required this.comment,
    required this.timestamp,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      ReviewModel(
        bookId: json['bookId'],
        userId: json['userId'],
        rating: (json['rating'] as num).toDouble(),
        comment: json['comment'],
        timestamp: DateTime.parse(json['timestamp']),
      );

  Map<String, dynamic> toJson() =>
      {
        'bookId': bookId,
        'userId': userId,
        'rating': rating,
        'comment': comment,
        'timestamp': timestamp.toIso8601String(),
      };
}
