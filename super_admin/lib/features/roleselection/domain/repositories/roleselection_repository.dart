import '../entities/roleselection.dart';

abstract class RoleselectionRepository {
  Future<Roleselection> fetchRoleselection(String id);
}
