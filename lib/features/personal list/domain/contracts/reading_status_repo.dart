import '../entities/reading_status_entity.dart';

abstract class ReadingStatusRepo {
  Future<void> addReadingStatus(ReadingStatusEntity entity);

  Future<List<ReadingStatusEntity>> getReadingStatus(
      String status, String userId);
}
