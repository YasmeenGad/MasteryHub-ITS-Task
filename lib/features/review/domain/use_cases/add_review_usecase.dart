import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../contracts/review_repo.dart';
import '../entities/review_entity.dart';

@injectable
class AddReviewUseCase {
  final ReviewRepo _repo;

  const AddReviewUseCase(this._repo);

  Future<DataResult<void>> call(ReviewEntity review) async =>
      await _repo.addReview(review);
}
