import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mastery_hub_its_task/core/networking/common/api_result.dart';
import 'package:mastery_hub_its_task/features/auth/domain/use_cases/signin_usecase.dart';
import 'package:mastery_hub_its_task/features/auth/presentation/viewModel/auth_action.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/response/user_entity.dart';
import '../../domain/use_cases/signup_usecase.dart';

part 'auth_view_model_state.dart';

@injectable
class AuthViewModelCubit extends Cubit<AuthViewModelState> {
  final SignUpUseCase _signUpUseCase;
  final SignInUseCase _signInUseCase;

  AuthViewModelCubit(this._signUpUseCase, this._signInUseCase)
      : super(AuthViewModelInitial());

  void doAction(AuthAction action) {
    switch (action) {
      case SignUpAction():
        _signUp(
            email: action.email,
            password: action.password,
            userName: action.userName);
      case LoginAction():
        _signIn(email: action.email, password: action.password);
    }
  }

  Future<void> _signUp({
    required String email,
    required String password,
    required String userName,
  }) async {
    emit(SignUpLoading());
    final response = await _signUpUseCase.call(
      email: email,
      password: password,
      userName: userName,
    );

    switch (response) {
      case Success<UserEntity>():
        emit(SignUpSuccess(response.data));
      case Fail<UserEntity>():
        emit(SignUpFailure(response.exception!));
    }
  }

  Future<void> _signIn({
    required String email,
    required String password,
  }) async {
    emit(SignInLoading());
    final response = await _signInUseCase.call(
      email: email,
      password: password,
    );

    switch (response) {
      case Success<UserEntity>():
        emit(SignInSuccess(response.data));
      case Fail<UserEntity>():
        emit(SignInFailure(response.exception!));
    }
  }
}
