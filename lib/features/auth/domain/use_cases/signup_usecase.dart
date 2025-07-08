import '../contracts/auth_repo.dart';
import '../entities/response/user_entity.dart';

class SignUpUseCase {
  final AuthRepo _repo;

  const SignUpUseCase(this._repo);

  Future<UserEntity> call({
    required String email,
    required String password,
    required String userName,
  }) {
    return _repo.signUp(
      email: email,
      password: password,
      userName: userName,
    );
  }
}
