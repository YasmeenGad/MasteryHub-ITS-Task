import '../../domain/entities/reading_status_entity.dart';
import '../models/reading_status_model.dart';

class ReadingStatusMapper {
  static ReadingStatusModel toModel(ReadingStatusEntity entity) {
    return ReadingStatusModel(
      bookId: entity.bookId,
      userId: entity.userId,
      status: entity.status,
      updatedAt: entity.updatedAt,
    );
  }

  static ReadingStatusEntity toEntity(ReadingStatusModel model) {
    return ReadingStatusEntity(
      bookId: model.bookId,
      userId: model.userId,
      status: model.status,
      updatedAt: model.updatedAt,
    );
  }
}
