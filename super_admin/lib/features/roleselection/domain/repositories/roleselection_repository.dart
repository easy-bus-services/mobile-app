import '../entities/roleselection.dart';

abstract class RoleselectionRepository {
  Future<List<Roleselection>> getAllRoles();
}
