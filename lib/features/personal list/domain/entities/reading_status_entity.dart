class ReadingStatusEntity {
  final String bookId;
  final String userId;
  final String status;
  final DateTime updatedAt;

  const ReadingStatusEntity({
    required this.bookId,
    required this.userId,
    required this.status,
    required this.updatedAt,
  });
}
