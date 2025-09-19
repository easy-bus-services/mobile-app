import 'package:get_it/get_it.dart';
import 'package:super_admin/core/network/api_client.dart';
import 'package:super_admin/features/auth/data/repositories/user_repository_impl.dart';
import 'package:super_admin/features/auth/domain/repositories/auth_repository.dart';
import 'package:super_admin/features/auth/domain/repositories/user_repository.dart';
import 'package:super_admin/features/auth/domain/usecases/get_auth.dart';
import 'package:super_admin/features/auth/domain/usecases/get_user.dart';
import 'package:super_admin/features/auth/presentation/bloc/user_bloc.dart';
import '../features/auth/data/repositories/auth_repository_impl.dart';
import '../features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

void initDependencies() {
  // Core
  sl.registerLazySingleton(() => ApiClient());
  //Auth feature
  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

  // Use Cases
  sl.registerFactory(() => GetAuth(sl()));

  // Blocs
  sl.registerFactory(() => AuthBloc(sl()));
  // User Feature
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));
  sl.registerFactory(() => GetUser(sl()));
  sl.registerFactory(() => UserBloc(sl()));
}
