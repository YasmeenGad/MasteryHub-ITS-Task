import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/reading_status_entity.dart';
import '../../../mapper/reading_status_mapper.dart';
import '../../../models/reading_status_model.dart';
import '../contracts/reading_status_online_data_source.dart';

@Injectable(as: ReadingStatusOnlineDataSource)
class ReadingStatusOnlineDataSourceImpl
    implements ReadingStatusOnlineDataSource {
  final FirebaseFirestore _firestore;

  @factoryMethod
  ReadingStatusOnlineDataSourceImpl(this._firestore);

  @override
  Future<void> addReadingStatus(ReadingStatusEntity entity) async {
    final model = ReadingStatusMapper.toModel(entity);
    await _firestore.collection('readingStatus').add(model.toJson());
  }

  @override
  Future<List<ReadingStatusEntity>> getReadingStatus(
      String status, String userId) async {
    final snapshot = await _firestore
        .collection('readingStatus')
        .where('status', isEqualTo: status)
        .where('userId', isEqualTo: userId)
        .get();

    return snapshot.docs.map((doc) {
      final model = ReadingStatusModel.fromJson(doc.data());
      return ReadingStatusMapper.toEntity(model);
    }).toList();
  }
}
