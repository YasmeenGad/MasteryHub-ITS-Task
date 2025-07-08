import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/response/user_entity.dart';
import '../../domain/use_cases/signin_usecase.dart';
import '../../domain/use_cases/signup_usecase.dart';

part 'auth_view_model_state.dart';

@injectable
class AuthViewModelCubit extends Cubit<AuthViewModelState> {
  AuthViewModelCubit() : super(AuthViewModelInitial());
}
