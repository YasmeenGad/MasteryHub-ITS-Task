// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/networking/api/api_manager.dart' as _i282;
import '../core/networking/network_factory.dart' as _i377;
import '../features/auth/data/data_sources/contracts/auth_remote_data_source.dart'
    as _i681;
import '../features/auth/data/data_sources/impl/auth_remote_data_source_impl.dart'
    as _i650;
import '../features/auth/data/repositories/auth_repo_impl.dart' as _i990;
import '../features/auth/domain/contracts/auth_repo.dart' as _i665;
import '../features/auth/domain/use_cases/signin_usecase.dart' as _i317;
import '../features/auth/domain/use_cases/signup_usecase.dart' as _i548;
import '../features/auth/presentation/viewModel/auth_view_model_cubit.dart'
    as _i448;
import '../features/home/data/data_sources/online/contracts/get_books_online_data_source.dart'
    as _i16;
import '../features/home/data/data_sources/online/impl/get_books_online_data_source_impl.dart'
    as _i673;
import 'module.dart' as _i946;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkFactory = _$NetworkFactory();
    final firebaseModule = _$FirebaseModule();
    gh.factory<_i361.LogInterceptor>(
        () => networkFactory.providerInterceptor());
    gh.lazySingleton<_i361.Dio>(() => networkFactory.provideDio());
    gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.singleton<_i282.ApiManager>(() => _i282.ApiManager(gh<_i361.Dio>()));
    gh.factory<_i16.GetBooksOnlineDataSource>(
        () => _i673.GetBooksOnlineDataSourceImpl(gh<_i282.ApiManager>()));
    gh.factory<_i681.AuthRemoteDataSource>(
        () => _i650.AuthRemoteDataSourceImpl(gh<_i59.FirebaseAuth>()));
    gh.factory<_i665.AuthRepo>(
        () => _i990.AuthRepoImpl(gh<_i681.AuthRemoteDataSource>()));
    gh.factory<_i317.SignInUseCase>(
        () => _i317.SignInUseCase(gh<_i665.AuthRepo>()));
    gh.factory<_i548.SignUpUseCase>(
        () => _i548.SignUpUseCase(gh<_i665.AuthRepo>()));
    gh.factory<_i448.AuthViewModelCubit>(() => _i448.AuthViewModelCubit(
          gh<_i548.SignUpUseCase>(),
          gh<_i317.SignInUseCase>(),
        ));
    return this;
  }
}

class _$NetworkFactory extends _i377.NetworkFactory {}

class _$FirebaseModule extends _i946.FirebaseModule {}
