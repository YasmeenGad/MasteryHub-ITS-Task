import '../entities/response/user_entity.dart';

abstract class AuthRepo {
  Future<UserEntity> signUp({String email, String password, String userName});

  Future<UserEntity> signIn({String email, String password});
}
