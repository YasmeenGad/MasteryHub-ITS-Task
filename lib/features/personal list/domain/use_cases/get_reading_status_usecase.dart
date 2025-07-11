import 'package:injectable/injectable.dart';
import 'package:mastery_hub_its_task/core/networking/common/api_result.dart';

import '../contracts/reading_status_repo.dart';
import '../entities/reading_status_entity.dart';

@injectable
class GetReadingStatusUseCase {
  final ReadingStatusRepo _repo;

  GetReadingStatusUseCase(this._repo);

  Future<DataResult<List<ReadingStatusEntity>>> call(
          String status, String userId) async =>
      await _repo.getReadingStatus(status, userId);
}
