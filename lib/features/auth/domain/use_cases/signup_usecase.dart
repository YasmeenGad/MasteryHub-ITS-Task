import 'package:injectable/injectable.dart';
import 'package:mastery_hub_its_task/core/networking/common/api_result.dart';

import '../contracts/auth_repo.dart';
import '../entities/response/user_entity.dart';

@injectable
class SignUpUseCase {
  final AuthRepo _repo;

  const SignUpUseCase(this._repo);

  Future<DataResult<UserEntity>> call({
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
