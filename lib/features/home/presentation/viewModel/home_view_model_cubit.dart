import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mastery_hub_its_task/core/networking/common/api_result.dart';
import 'package:mastery_hub_its_task/core/networking/error/api_error_handler.dart';
import 'package:mastery_hub_its_task/core/networking/error/error_model.dart';
import 'package:mastery_hub_its_task/features/home/domain/entities/response/get_books_response_entity.dart';
import 'package:mastery_hub_its_task/features/home/presentation/viewModel/home_action.dart';
import 'package:meta/meta.dart';

import '../../domain/use_cases/get_books_usecase.dart';

part 'home_view_model_state.dart';

@injectable
class HomeViewModelCubit extends Cubit<HomeViewModelState> {
  final GetBooksUseCase _getBooksUseCase;

  HomeViewModelCubit(this._getBooksUseCase) : super(HomeViewModelInitial());

  void doAction(HomeAction action) {
    switch (action) {
      case GetBooksAction():
        _getBooks();
    }
  }

  Future<void> _getBooks() async {
    emit(GetBooksLoading());
    final result = await _getBooksUseCase.call();
    switch (result) {
      case Success<GetBooksResponseEntity>():
        emit(GetBooksSuccess(result.data));
      case Fail<GetBooksResponseEntity>():
        emit(GetBooksError(ApiErrorHandler.handle(result.exception!)));
    }
  }
}
