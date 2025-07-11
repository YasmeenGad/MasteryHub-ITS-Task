import '../../../models/reading_status_model.dart';

abstract class ReadingStatusOnlineDataSource {
  Future<void> updateReadingStatus(ReadingStatusModel model);

  Future<List<ReadingStatusModel>> getReadingStatuses(String userId);
}
