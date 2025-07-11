import 'package:injectable/injectable.dart';
import 'package:mastery_hub_its_task/core/networking/common/api_result.dart';

import '../contracts/reading_status_repo.dart';
import '../entities/reading_status_entity.dart';

@injectable
class AddReadingStatusUseCase {
  final ReadingStatusRepo _repo;

  AddReadingStatusUseCase(this._repo);

  Future<DataResult<void>> call(ReadingStatusEntity entity) async =>
      await _repo.addReadingStatus(entity);
}
