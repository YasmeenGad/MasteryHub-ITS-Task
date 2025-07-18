import 'package:injectable/injectable.dart';
import 'package:mastery_hub_its_task/features/auth/domain/contracts/auth_repo.dart';
import 'package:mastery_hub_its_task/features/auth/domain/entities/response/user_entity.dart';

import '../../../../core/networking/common/api_result.dart';
import '../data_sources/contracts/auth_remote_data_source.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _remoteDataSource;

  @factoryMethod
  const AuthRepoImpl(this._remoteDataSource);

  @override
  Future<DataResult<UserEntity>> signIn(
      {required String email, required String password}) async {
    final model = await _remoteDataSource.signIn(
      email: email,
      password: password,
    );
    return model;
  }

  @override
  Future<DataResult<UserEntity>> signUp(
      {required String email,
      required String password,
      required String userName}) async {
    final model = await _remoteDataSource.signUp(
      email: email,
      password: password,
      userName: userName,
    );
    return model;
  }
}
