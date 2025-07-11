import '../../domain/entities/reading_status_entity.dart';
import '../models/reading_status_model.dart';

class ReadingStatusMapper {
  static ReadingStatusModel toModel(ReadingStatusEntity entity) {
    return ReadingStatusModel(
      userId: entity.userId,
      status: entity.status,
      bookData: entity.bookData,
    );
  }

  static ReadingStatusEntity toEntity(ReadingStatusModel model) {
    return ReadingStatusEntity(
      userId: model.userId,
      status: model.status,
      bookData: model.bookData,
    );
  }
}
