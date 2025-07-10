part of 'home_view_model_cubit.dart';

@immutable
sealed class HomeViewModelState {}

final class HomeViewModelInitial extends HomeViewModelState {}

final class GetBooksLoading extends HomeViewModelState {}

final class GetBooksSuccess extends HomeViewModelState {
  final GetBooksResponseEntity books;

  GetBooksSuccess(this.books);
}

final class GetBooksError extends HomeViewModelState {
  final ErrorModel failureMessage;

  GetBooksError(this.failureMessage);
}
