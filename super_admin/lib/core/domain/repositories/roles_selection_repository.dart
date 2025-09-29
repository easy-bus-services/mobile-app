import '../entities/roles_selection.dart';

abstract class RolesSelectionRepository {
  Future<List<RolesSelection>> fetchRoles();
  Future<RolesSelection> deleteRole(int roleId);
}
