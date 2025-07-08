import 'package:mastery_hub_its_task/features/auth/data/mapper/auth_mapper.dart';
import 'package:mastery_hub_its_task/features/auth/domain/contracts/auth_repo.dart';
import 'package:mastery_hub_its_task/features/auth/domain/entities/response/user_entity.dart';

import '../data_sources/contracts/auth_remote_data_source.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _remoteDataSource;

  const AuthRepoImpl(this._remoteDataSource);

  @override
  Future<UserEntity> signIn(
      {required String email, required String password}) async {
    final userModel = await _remoteDataSource.signIn(
      email: email,
      password: password,
    );
    return AuthMapper.toEntity(userModel);
  }

  @override
  Future<UserEntity> signUp(
      {required String email,
      required String password,
      required String userName}) async {
    final userModel = await _remoteDataSource.signUp(
      email: email,
      password: password,
      userName: userName,
    );
    return AuthMapper.toEntity(userModel);
  }
}
