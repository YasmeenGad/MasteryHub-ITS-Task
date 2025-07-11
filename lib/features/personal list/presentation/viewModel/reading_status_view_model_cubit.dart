import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mastery_hub_its_task/core/networking/error/error_model.dart';
import 'package:mastery_hub_its_task/features/personal%20list/domain/use_cases/add_reading_status_use_case.dart';
import 'package:mastery_hub_its_task/features/personal%20list/domain/use_cases/get_reading_status_usecase.dart';
import 'package:mastery_hub_its_task/features/personal%20list/presentation/viewModel/reading_status_action.dart';
import 'package:meta/meta.dart';

import '../../../../core/networking/common/api_result.dart';
import '../../../../core/networking/error/firebase_error_handler.dart';
import '../../domain/entities/reading_status_entity.dart';

part 'reading_status_view_model_state.dart';

@injectable
class ReadingStatusViewModelCubit extends Cubit<ReadingStatusViewModelState> {
  final AddReadingStatusUseCase _addReadingStatusUseCase;
  final GetReadingStatusUseCase _getReadingStatusUseCase;

  void doAction(ReadingStatusAction action) {
    switch (action) {
      case AddReadingStatusAction():
        _addReadingStatus(action.entity);
      case GetReadingStatusAction():
        _getReadingStatus(action.status, action.userId);
    }
  }

  ReadingStatusViewModelCubit(
      this._addReadingStatusUseCase, this._getReadingStatusUseCase)
      : super(ReadingStatusViewModelInitial());

  Future<void> _addReadingStatus(ReadingStatusEntity entity) async {
    emit(AddReadingStatusLoading());
    final result = await _addReadingStatusUseCase.call(entity);
    switch (result) {
      case Success<void>():
        emit(AddReadingStatusSuccess());
      case Fail<void>():
        emit(AddReadingStatusError(
            FirebaseErrorHandler.handle(result.exception!)));
    }
  }

  Future<void> _getReadingStatus(String status, String userId) async {
    emit(GetReadingStatusLoading());
    final result = await _getReadingStatusUseCase.call(status, userId);
    switch (result) {
      case Success<List<ReadingStatusEntity>>():
        emit(GetReadingStatusSuccess(result.data));
      case Fail<List<ReadingStatusEntity>>():
        emit(GetReadingStatusError(
            FirebaseErrorHandler.handle(result.exception!)));
    }
  }
}
