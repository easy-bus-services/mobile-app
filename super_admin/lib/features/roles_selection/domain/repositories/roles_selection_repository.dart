import '../entities/roles_selection.dart';

abstract class RolesSelectionRepository {
  Future<RolesSelection> fetchRolesSelection(String id);
}
