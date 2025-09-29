import 'package:get_it/get_it.dart';
import 'package:super_admin/core/data/repositories/roles_selection_repository_impl.dart';
import 'package:super_admin/core/domain/repositories/roles_selection_repository.dart';
import 'package:super_admin/core/domain/usecases/get_roles_selection.dart';
import 'package:super_admin/core/network/api_client.dart';
import 'package:super_admin/core/presentation/blocs/roles_selection_bloc.dart';
import 'package:super_admin/features/auth/domain/repositories/auth_repository.dart';
import 'package:super_admin/features/auth/domain/usecases/get_auth.dart';
import 'package:super_admin/features/roles/data/repositories/roles_repository_impl.dart';
import 'package:super_admin/features/roles/domain/repositories/roles_repository.dart';
import 'package:super_admin/features/roles/domain/usecases/get_roles.dart';
import 'package:super_admin/features/roles/presentation/bloc/roles_bloc.dart';
import 'package:super_admin/features/roles/presentation/bloc/tab_event.dart';
import 'package:super_admin/features/users/data/repositories/users_repository_impl.dart';
import 'package:super_admin/features/users/domain/repositories/users_repository.dart';
import 'package:super_admin/features/users/domain/usecases/get_users.dart';
import 'package:super_admin/features/users/presentation/bloc/users_bloc.dart';
import '../features/auth/data/repositories/auth_repository_impl.dart';
import '../features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

void initDependencies() {
  // users feature
  sl.registerLazySingleton<UsersRepository>(() => UsersRepositoryImpl());
  sl.registerFactory(() => GetUsers(sl()));
  sl.registerFactory(() => UsersBloc(sl()));

  // roles feature
  sl.registerLazySingleton<RolesRepository>(() => RolesRepositoryImpl());
  sl.registerFactory(() => GetRoles(sl()));
  sl.registerFactory(() => RolesBloc(sl()));


  // roles_selection feature
  sl.registerLazySingleton<RolesSelectionRepository>(() => RolesSelectionRepositoryImpl(sl()));
  sl.registerFactory(() => GetRolesSelection(sl()));
  sl.registerFactory(() => RolesSelectionBloc(sl()));
  sl.registerFactory(() => TabBloc());

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
