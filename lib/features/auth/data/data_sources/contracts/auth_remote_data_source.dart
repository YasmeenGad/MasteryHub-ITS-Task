import 'package:mastery_hub_its_task/core/networking/common/api_result.dart';
import 'package:mastery_hub_its_task/features/auth/domain/entities/response/user_entity.dart';

import '../../models/response/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<DataResult<UserEntity>> signUp(
      {required String email,
      required String password,
      required String userName});

  Future<DataResult<UserEntity>> signIn(
      {required String email, required String password});
}
