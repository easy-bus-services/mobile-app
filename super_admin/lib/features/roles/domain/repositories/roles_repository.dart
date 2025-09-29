import '../entities/roles.dart';

abstract class RolesRepository {
  Future<Roles> fetchRoles(String id);
}
