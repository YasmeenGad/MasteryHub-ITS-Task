import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mastery_hub_its_task/core/networking/common/api_result.dart';
import 'package:mastery_hub_its_task/core/networking/error/error_model.dart';
import 'package:mastery_hub_its_task/features/search/domain/entities/response/search_response_entity.dart';
import 'package:mastery_hub_its_task/features/search/domain/use_cases/search_usecase.dart';
import 'package:mastery_hub_its_task/features/search/presentation/viewModel/search_action.dart';
import 'package:meta/meta.dart';

import '../../../../core/networking/error/api_error_handler.dart';

part 'search_view_model_state.dart';

@injectable
class SearchViewModelCubit extends Cubit<SearchViewModelState> {
  final SearchUseCase _searchUseCase;

  SearchViewModelCubit(this._searchUseCase) : super(SearchViewModelInitial());

  void doAction(SearchAction action) {
    switch (action) {
      case GetSearchedBooks():
        _search(action.query);
    }
  }

  Future<void> _search(String query) async {
    emit(SearchLoading());
    final response = await _searchUseCase.call(query);

    switch (response) {
      case Success<SearchResponseEntity>():
        emit(SearchSuccess(response.data));
      case Fail<SearchResponseEntity>():
        emit(SearchFailure(ApiErrorHandler.handle(response.exception!)));
    }
  }
}
