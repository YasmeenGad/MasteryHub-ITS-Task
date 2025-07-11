import 'package:injectable/injectable.dart';

import '../contracts/reading_status_repo.dart';
import '../entities/reading_status_entity.dart';

@injectable
class AddReadingStatusUseCase {
  final ReadingStatusRepo _repo;

  AddReadingStatusUseCase(this._repo);

  Future<void> call(ReadingStatusEntity entity) async =>
      await _repo.addReadingStatus(entity);
}
