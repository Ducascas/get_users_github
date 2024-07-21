import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:get_users_github/src/cubit/user_cubit/user_cubit.dart';
import 'package:get_users_github/src/data/datasource/users_api.dart';
import 'package:get_users_github/src/data/repositories/user_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Cubit
  sl.registerFactory(() => UserCubit(userRepository: sl<UserRepository>()));

  //Repository
  sl.registerLazySingleton<UserRepository>(
      () => UserRepository(usersApi: sl()));

  //Datasource
  sl.registerLazySingleton<UsersApi>(() => UsersApi(sl()));

  //External
  sl.registerLazySingleton(() => Dio());
}
