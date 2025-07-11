import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:mastery_hub_its_task/core/networking/common/api_result.dart';
import 'package:mastery_hub_its_task/features/review/data/data_sources/online/contracts/review_online_data_source.dart';
import 'package:mastery_hub_its_task/features/review/domain/entities/review_entity.dart';

import '../../../../../../core/networking/api_execute.dart';
import '../../../mapper/review_mapper.dart';
import '../../../models/review_model.dart';

@Injectable(as: ReviewOnlineDataSource)
class ReviewOnlineDataSourceImpl implements ReviewOnlineDataSource {
  final FirebaseFirestore _firestore;

  @factoryMethod
  const ReviewOnlineDataSourceImpl(this._firestore);

  @override
  Future<DataResult<void>> addReview(ReviewEntity review) {
    return executeApi(() async {
      final model = ReviewMapper.toModel(review);
      await _firestore
          .collection('reviews')
          .doc(model.reviewId)
          .set(model.toJson());
    });
  }

  @override
  Future<DataResult<List<ReviewEntity>>> getReviewsForBook(String bookId) {
    return executeApi(() async {
      final query = await _firestore
          .collection('reviews')
          .where('bookId', isEqualTo: bookId)
          .orderBy('createdAt', descending: true)
          .get();

      return query.docs
          .map((doc) => ReviewMapper.toEntity(ReviewModel.fromJson(doc.data())))
          .toList();
    });
  }
}
