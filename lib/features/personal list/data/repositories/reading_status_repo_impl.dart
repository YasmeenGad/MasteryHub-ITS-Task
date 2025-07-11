import 'package:injectable/injectable.dart';
import 'package:mastery_hub_its_task/core/networking/common/api_result.dart';

import '../../domain/contracts/reading_status_repo.dart';
import '../../domain/entities/reading_status_entity.dart';
import '../data_sources/online/contracts/reading_status_online_data_source.dart';

@Injectable(as: ReadingStatusRepo)
class ReadingStatusRepoImpl implements ReadingStatusRepo {
  final ReadingStatusOnlineDataSource _dataSource;

  @factoryMethod
  ReadingStatusRepoImpl(this._dataSource);

  @override
  Future<DataResult<void>> addReadingStatus(ReadingStatusEntity entity) async {
    return await _dataSource.addReadingStatus(entity);
  }

  @override
  Future<DataResult<List<ReadingStatusEntity>>> getReadingStatus(
      String status, String userId) async {
    return await _dataSource.getReadingStatus(status, userId);
  }
}
