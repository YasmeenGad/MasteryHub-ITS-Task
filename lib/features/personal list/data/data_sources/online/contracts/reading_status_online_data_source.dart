import '../../../../domain/entities/reading_status_entity.dart';

abstract class ReadingStatusOnlineDataSource {
  Future<void> addReadingStatus(ReadingStatusEntity entity);

  Future<List<ReadingStatusEntity>> getReadingStatus(
      String status, String userId);
}
