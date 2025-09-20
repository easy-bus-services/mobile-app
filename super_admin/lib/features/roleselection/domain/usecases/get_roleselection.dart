import '../entities/roleselection.dart';
import '../repositories/roleselection_repository.dart';

class GetRoleselection {
  final RoleselectionRepository repository;

  GetRoleselection(this.repository);

  Future<Roleselection> call(String id) {
    return repository.fetchRoleselection(id);
  }
}
