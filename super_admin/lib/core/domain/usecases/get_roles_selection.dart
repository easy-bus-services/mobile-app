import '../entities/roles_selection.dart';
import '../repositories/roles_selection_repository.dart';

class GetRolesSelection {
  final RolesSelectionRepository repository;

  GetRolesSelection(this.repository);

  Future<List<RolesSelection>> call() {
    return repository.fetchRoles();
  }
}
class DeleteRoles {
  final RolesSelectionRepository repository;

  DeleteRoles(this.repository);

  Future<RolesSelection> call(int id) {
    return repository.deleteRole(id);
  }
}