import 'package:mastery_hub_its_task/features/auth/domain/entities/response/user_entity.dart';

import '../../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserEntity> signUp(String email, String password, String userName);

  Future<UserEntity> signIn(String email, String password);
}
