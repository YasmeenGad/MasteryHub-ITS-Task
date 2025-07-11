class ReadingStatusModel {
  final String bookId;
  final String userId;
  final String status;
  final DateTime updatedAt;

  const ReadingStatusModel({
    required this.bookId,
    required this.userId,
    required this.status,
    required this.updatedAt,
  });

  factory ReadingStatusModel.fromJson(Map<String, dynamic> json) {
    return ReadingStatusModel(
      bookId: json['bookId'],
      userId: json['userId'],
      status: json['status'],
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bookId': bookId,
      'userId': userId,
      'status': status,
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
