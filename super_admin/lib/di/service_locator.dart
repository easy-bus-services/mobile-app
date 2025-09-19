import 'package:get_it/get_it.dart';
import 'package:super_admin/core/network/api_client.dart';
import 'package:super_admin/features/auth/domain/repositories/auth_repository.dart';
import 'package:super_admin/features/auth/domain/usecases/get_auth.dart';
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
}
