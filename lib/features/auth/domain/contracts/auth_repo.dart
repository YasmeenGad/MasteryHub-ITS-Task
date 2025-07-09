import 'package:mastery_hub_its_task/core/networking/common/api_result.dart';

import '../entities/response/user_entity.dart';

abstract class AuthRepo {
  Future<DataResult<UserEntity>> signUp(
      {required String email,
      required String password,
      required String userName});

  Future<DataResult<UserEntity>> signIn(
      {required String email, required String password});
}
