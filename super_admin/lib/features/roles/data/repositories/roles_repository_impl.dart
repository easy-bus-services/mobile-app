import '../../domain/entities/roles.dart';
import '../../domain/repositories/roles_repository.dart';
import '../models/roles_dto.dart';

class RolesRepositoryImpl implements RolesRepository {
  @override
  Future<Roles> fetchRoles(String id) async {
    // Simulated API call
    await Future.delayed(const Duration(seconds: 1));
    return RolesDto(id: id).toEntity();
  }
}
