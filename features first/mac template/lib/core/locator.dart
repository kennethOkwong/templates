//GetIt is used for dependency injection
//this file contains all the necessary registrations

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'local storage/local_storage_servcie.dart';
import 'local storage/user_local_data.dart';
import '../features/authentication/data/data source/auth_data_source.dart';
import '../features/authentication/data/data source/remote source/auth_remote_data_source.dart';
import '../features/base/base_vm.dart';
import '../features/authentication/data/repository/auth_repository_impl.dart';
import '../features/authentication/domain/repository/auth_repository.dart';

final getIt = GetIt.I;

void setUpLocator() {
  _setupDio();
  _registerLocalStorageServices();
  _registerRepositories();
  _registerViewModel();
}

//function to setup pretty dio interceptor
void _setupDio() {
  getIt.registerFactory(() {
    Dio dio = Dio();
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
    return dio;
  });
}

//function to register local sotorage services
void _registerLocalStorageServices() {
  getIt.registerLazySingleton<LocalStorageService>(() => LocalStorageService());
  getIt.registerLazySingleton<UserLocalStorage>(() => UserLocalStorage());
}

//function to register repositories and data sources
void _registerRepositories() {
  //auth repository
  getIt.registerFactory<AuthDataSource>(
    () => AuthRemoteDataSource(getIt<Dio>(), getIt<UserLocalStorage>()),
  );
  getIt.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(getIt<AuthDataSource>()),
  );
}

//function to register view models
void _registerViewModel() {
  //View Model
  getIt.registerFactory<BaseViewModel>(() => BaseViewModel());
}
