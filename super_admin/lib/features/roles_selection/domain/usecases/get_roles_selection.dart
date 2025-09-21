import '../entities/roles_selection.dart';
import '../repositories/roles_selection_repository.dart';

class GetRolesSelection {
  final RolesSelectionRepository repository;

  GetRolesSelection(this.repository);

  Future<RolesSelection> call(String id) {
    return repository.fetchRolesSelection(id);
  }
}
