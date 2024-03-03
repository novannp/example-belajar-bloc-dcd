import 'package:belajar_bloc2/features/user/data_source/user_remote_data_source.dart';
import 'package:belajar_bloc2/features/user/presentation/bloc/user_bloc.dart';
import 'package:belajar_bloc2/features/user/repository/user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final locator = GetIt.instance;

void init() {
// BLOC
  locator.registerFactory(() => UserBloc(locator()));

  // USER
  locator.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(locator()));
  locator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(locator()));

  // HTTP
  locator.registerLazySingleton(() => Client());
}
