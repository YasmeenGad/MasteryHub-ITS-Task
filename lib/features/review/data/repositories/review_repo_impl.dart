import 'package:injectable/injectable.dart';
import 'package:mastery_hub_its_task/core/networking/common/api_result.dart';
import 'package:mastery_hub_its_task/features/review/domain/contracts/review_repo.dart';
import 'package:mastery_hub_its_task/features/review/domain/entities/review_entity.dart';

import '../data_sources/online/contracts/review_online_data_source.dart';

@Injectable(as: ReviewRepo)
class ReviewRepoImpl implements ReviewRepo {
  final ReviewOnlineDataSource _onlineDataSource;

  @factoryMethod
  ReviewRepoImpl(this._onlineDataSource);

  @override
  Future<DataResult<void>> addReview(ReviewEntity review) async =>
      await _onlineDataSource.addReview(review);

  @override
  Future<DataResult<List<ReviewEntity>>> getReviewsForBook(
          String bookId) async =>
      await _onlineDataSource.getReviewsForBook(bookId);
}
