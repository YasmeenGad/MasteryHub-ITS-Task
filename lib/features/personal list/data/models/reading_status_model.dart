class ReadingStatusModel {
  final String userId;
  final String status;
  final Map<String, dynamic> bookData;

  ReadingStatusModel({
    required this.userId,
    required this.status,
    required this.bookData,
  });

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'status': status,
        'bookData': bookData,
      };

  factory ReadingStatusModel.fromJson(Map<String, dynamic> json) {
    return ReadingStatusModel(
      userId: json['userId'],
      status: json['status'],
      bookData: Map<String, dynamic>.from(json['bookData']),
    );
  }
}
