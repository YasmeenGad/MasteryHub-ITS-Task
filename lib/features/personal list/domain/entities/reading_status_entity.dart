class ReadingStatusEntity {
  final String userId;
  final String status;
  final Map<String, dynamic> bookData;

  ReadingStatusEntity({
    required this.userId,
    required this.status,
    required this.bookData,
  });
}
