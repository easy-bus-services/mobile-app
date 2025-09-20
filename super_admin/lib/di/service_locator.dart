import 'package:get_it/get_it.dart';
import 'package:super_admin/core/network/api_client.dart';
import 'package:super_admin/features/auth/domain/repositories/auth_repository.dart';
import 'package:super_admin/features/auth/domain/usecases/get_auth.dart';
import 'package:super_admin/features/roleselection/data/repositories/roleselection_repository_impl.dart';
import 'package:super_admin/features/roleselection/domain/repositories/roleselection_repository.dart';
import 'package:super_admin/features/roleselection/domain/usecases/get_roleselection.dart';
import 'package:super_admin/features/roleselection/presentation/bloc/bloc/get_all_roles_bloc.dart';
import 'package:super_admin/features/roleselection/presentation/bloc/roleselection_bloc.dart';
import '../features/auth/data/repositories/auth_repository_impl.dart';
import '../features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

void initDependencies() {
  // roleselection feature
  sl.registerLazySingleton<RoleselectionRepository>(() => RoleselectionRepositoryImpl(sl()));
  sl.registerFactory(() => GetRoleselection(sl()));
  sl.registerFactory(() => RoleselectionBloc(sl()));
  sl.registerFactory(() => GetAllRolesBloc(sl()));
  sl.registerFactory(() => GetAllRoles(sl()));

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
