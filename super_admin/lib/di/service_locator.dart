import 'package:get_it/get_it.dart';
import 'package:super_admin/core/network/api_client.dart';
import 'package:super_admin/features/auth/domain/repositories/auth_repository.dart';
import 'package:super_admin/features/auth/domain/usecases/get_auth.dart';
import 'package:super_admin/features/roles_selection/data/repositories/roles_selection_repository_impl.dart';
import 'package:super_admin/features/roles_selection/domain/repositories/roles_selection_repository.dart';
import 'package:super_admin/features/roles_selection/domain/usecases/get_roles_selection.dart';
import 'package:super_admin/features/roles_selection/presentation/bloc/roles_selection_bloc.dart';
import '../features/auth/data/repositories/auth_repository_impl.dart';
import '../features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

void initDependencies() {

  // roles_selection feature
  sl.registerLazySingleton<RolesSelectionRepository>(() => RolesSelectionRepositoryImpl(sl()));
  sl.registerFactory(() => GetRolesSelection(sl()));
  sl.registerFactory(() => RolesSelectionBloc(sl()));

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
