import 'package:injectable/injectable.dart';
import 'package:mastery_hub_its_task/core/networking/common/api_result.dart';

import '../contracts/auth_repo.dart';
import '../entities/response/user_entity.dart';

@injectable
class SignInUseCase {
  final AuthRepo _repo;

  const SignInUseCase(this._repo);

  Future<DataResult<UserEntity>> call({
    required String email,
    required String password,
  }) {
    return _repo.signIn(
      email: email,
      password: password,
    );
  }
}
