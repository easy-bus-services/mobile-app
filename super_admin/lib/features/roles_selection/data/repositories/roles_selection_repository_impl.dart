import '../../domain/entities/roles_selection.dart';
import '../../domain/repositories/roles_selection_repository.dart';
import '../models/roles_selection_dto.dart';

class RolesSelectionRepositoryImpl implements RolesSelectionRepository {
  @override
  Future<RolesSelection> fetchRolesSelection(String id) async {
    // Simulated API call
    await Future.delayed(const Duration(seconds: 1));
    return RolesSelectionDto(id: id).toEntity();
  }
}
