import '../entities/roles.dart';
import '../repositories/roles_repository.dart';

class GetRoles {
  final RolesRepository repository;

  GetRoles(this.repository);

  Future<Roles> call(String id) {
    return repository.fetchRoles(id);
  }
}
