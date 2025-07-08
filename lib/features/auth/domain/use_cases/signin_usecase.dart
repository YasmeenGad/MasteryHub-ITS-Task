import '../contracts/auth_repo.dart';
import '../entities/response/user_entity.dart';

class SignInUseCase {
  final AuthRepo _repo;

  const SignInUseCase(this._repo);

  Future<UserEntity> call({
    required String email,
    required String password,
  }) {
    return _repo.signIn(
      email: email,
      password: password,
    );
  }
}
