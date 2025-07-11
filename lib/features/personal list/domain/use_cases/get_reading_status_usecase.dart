import 'package:injectable/injectable.dart';

import '../contracts/reading_status_repo.dart';
import '../entities/reading_status_entity.dart';

@injectable
class GetReadingStatusUseCase {
  final ReadingStatusRepo _repo;

  GetReadingStatusUseCase(this._repo);

  Future<List<ReadingStatusEntity>> call(String status, String userId) async =>
      await _repo.getReadingStatus(status, userId);
}
