import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:mastery_hub_its_task/features/auth/data/mapper/auth_mapper.dart';
import 'package:mastery_hub_its_task/features/auth/domain/entities/response/user_entity.dart';

import '../../../../../core/networking/api_execute.dart';
import '../../../../../core/networking/common/api_result.dart';
import '../../models/response/user_model.dart';
import '../contracts/auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _auth;

  @factoryMethod
  const AuthRemoteDataSourceImpl(this._auth);

  @override
  Future<DataResult<UserEntity>> signIn(
      {required String email, required String password}) {
    return executeApi(() async {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return AuthMapper.toEntity(
          UserModel.fromFirebaseUser(userCredential.user!));
    });
  }

  @override
  Future<DataResult<UserEntity>> signUp(
      {required String email,
      required String password,
      required String userName}) {
    return executeApi(() async {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user!.updateDisplayName(userName);
      return AuthMapper.toEntity(
          UserModel.fromFirebaseUser(userCredential.user!));
    });
  }
}
