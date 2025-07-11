part of 'reading_status_view_model_cubit.dart';

@immutable
sealed class ReadingStatusViewModelState {}

final class ReadingStatusViewModelInitial extends ReadingStatusViewModelState {}

/* add reading status states */
final class AddReadingStatusLoading extends ReadingStatusViewModelState {}

final class AddReadingStatusSuccess extends ReadingStatusViewModelState {}

final class AddReadingStatusError extends ReadingStatusViewModelState {
  final ErrorModel message;

  AddReadingStatusError(this.message);
}

/* get reading status states */
final class GetReadingStatusLoading extends ReadingStatusViewModelState {}

final class GetReadingStatusSuccess extends ReadingStatusViewModelState {
  final List<ReadingStatusEntity> readingStatus;

  GetReadingStatusSuccess(this.readingStatus);
}

final class GetReadingStatusError extends ReadingStatusViewModelState {
  final ErrorModel message;

  GetReadingStatusError(this.message);
}
