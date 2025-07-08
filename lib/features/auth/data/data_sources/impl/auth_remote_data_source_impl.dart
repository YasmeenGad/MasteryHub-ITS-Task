import 'package:firebase_auth/firebase_auth.dart';
import 'package:mastery_hub_its_task/features/auth/data/mapper/auth_mapper.dart';
import 'package:mastery_hub_its_task/features/auth/domain/entities/response/user_entity.dart';

import '../../models/user_model.dart';
import '../contracts/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _auth;

  const AuthRemoteDataSourceImpl(this._auth);

  @override
  Future<UserEntity> signIn(String email, String password) async {
    final userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return AuthMapper.toEntity(
        UserModel.fromFirebaseUser(userCredential.user!));
  }

  @override
  Future<UserEntity> signUp(
      String email, String password, String userName) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await userCredential.user!.updateDisplayName(userName);
    return AuthMapper.toEntity(
        UserModel.fromFirebaseUser(userCredential.user!));
  }
}
