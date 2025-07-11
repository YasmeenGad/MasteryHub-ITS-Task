import 'package:mastery_hub_its_task/core/networking/common/api_result.dart';

import '../../../../domain/entities/reading_status_entity.dart';

abstract class ReadingStatusOnlineDataSource {
  Future<DataResult<void>> addReadingStatus(ReadingStatusEntity entity);

  Future<DataResult<List<ReadingStatusEntity>>> getReadingStatus(
      String status, String userId);
}
