import '../../domain/entities/roleselection.dart';
import '../../domain/repositories/roleselection_repository.dart';
import '../models/roleselection_dto.dart';

class RoleselectionRepositoryImpl implements RoleselectionRepository {
  @override
  Future<Roleselection> fetchRoleselection(String id) async {
    // Simulated API call
    await Future.delayed(const Duration(seconds: 1));
    return RoleselectionDto(id: id).toEntity();
  }
}
