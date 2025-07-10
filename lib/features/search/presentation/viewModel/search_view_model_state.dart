part of 'search_view_model_cubit.dart';

@immutable
sealed class SearchViewModelState {}

final class SearchViewModelInitial extends SearchViewModelState {}

final class SearchLoading extends SearchViewModelState {}

final class SearchSuccess extends SearchViewModelState {
  final SearchResponseEntity response;

  SearchSuccess(this.response);
}

final class SearchFailure extends SearchViewModelState {
  final ErrorModel failureMessage;

  SearchFailure(this.failureMessage);
}
