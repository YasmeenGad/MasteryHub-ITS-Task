import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_view_model_state.dart';

class AuthViewModelCubit extends Cubit<AuthViewModelState> {
  AuthViewModelCubit() : super(AuthViewModelInitial());
}
