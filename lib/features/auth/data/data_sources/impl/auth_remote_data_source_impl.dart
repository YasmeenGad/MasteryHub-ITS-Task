import 'package:firebase_auth/firebase_auth.dart';

import '../../models/response/user_model.dart';
import '../contracts/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _auth;

  const AuthRemoteDataSourceImpl(this._auth);

  @override
  Future<UserModel> signIn(
      {required String email, required String password}) async {
    final userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return UserModel.fromFirebaseUser(userCredential.user!);
  }

  @override
  Future<UserModel> signUp(
      {required String email,
      required String password,
      required String userName}) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await userCredential.user!.updateDisplayName(userName);
    return UserModel.fromFirebaseUser(userCredential.user!);
  }
}
