import '../entities/roleselection.dart';
import '../repositories/roleselection_repository.dart';

class GetRoleselection {
  final RoleselectionRepository repository;

  GetRoleselection(this.repository);

  Future<List<Roleselection>> call(String id) {
    return repository.getAllRoles();
  }
}

class GetAllRoles {
  final RoleselectionRepository repository;

  GetAllRoles(this.repository);

  Future<List<Roleselection>> call() {
    return repository.getAllRoles();
  }
}