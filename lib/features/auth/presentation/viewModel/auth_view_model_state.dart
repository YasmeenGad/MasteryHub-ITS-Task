part of 'auth_view_model_cubit.dart';

@immutable
sealed class AuthViewModelState {}

final class AuthViewModelInitial extends AuthViewModelState {}

/* sign up states */

final class SignUpLoading extends AuthViewModelCubit {}

final class SignUpSuccess extends AuthViewModelCubit {
  final UserEntity user;

  SignUpSuccess(this.user);
}

final class SignUpFailure extends AuthViewModelCubit {
  final String failureMessage;

  SignUpFailure(this.failureMessage);
}
