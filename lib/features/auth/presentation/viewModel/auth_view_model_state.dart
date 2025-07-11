part of 'auth_view_model_cubit.dart';

@immutable
sealed class AuthViewModelState {}

final class AuthViewModelInitial extends AuthViewModelState {}

/* sign up states */

final class SignUpLoading extends AuthViewModelState {}

final class SignUpSuccess extends AuthViewModelState {
  final UserEntity user;
  SignUpSuccess(this.user);
}

final class SignUpFailure extends AuthViewModelState {
  final Exception failureMessage;
  SignUpFailure(this.failureMessage);
}

/* sign in states */

final class SignInLoading extends AuthViewModelState {}

final class SignInSuccess extends AuthViewModelState {
  final UserEntity user;

  SignInSuccess(this.user);
}

final class SignInFailure extends AuthViewModelState {
  final ErrorModel failureMessage;

  SignInFailure(this.failureMessage);
}
