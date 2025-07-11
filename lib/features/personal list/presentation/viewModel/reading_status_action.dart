import '../../domain/entities/reading_status_entity.dart';

sealed class ReadingStatusAction {}

class AddReadingStatusAction extends ReadingStatusAction {
  final ReadingStatusEntity entity;

  AddReadingStatusAction(this.entity);
}

class GetReadingStatusAction extends ReadingStatusAction {
  final String status;
  final String userId;

  GetReadingStatusAction(this.status, this.userId);
}
