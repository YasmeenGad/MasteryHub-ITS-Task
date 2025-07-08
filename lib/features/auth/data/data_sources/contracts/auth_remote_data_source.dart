import '../../models/response/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signUp(
      {required String email,
      required String password,
      required String userName});

  Future<UserModel> signIn({required String email, required String password});
}
