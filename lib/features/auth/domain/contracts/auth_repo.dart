import '../entities/response/user_entity.dart';

abstract class AuthRepo {
  Future<UserEntity> signUp(
      {required String email,
      required String password,
      required String userName});

  Future<UserEntity> signIn({required String email, required String password});
}
