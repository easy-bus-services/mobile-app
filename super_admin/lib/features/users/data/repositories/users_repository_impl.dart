import '../../domain/entities/users.dart';
import '../../domain/repositories/users_repository.dart';
import '../models/users_dto.dart';

class UsersRepositoryImpl implements UsersRepository {
  @override
  Future<Users> fetchUsers(String id) async {
    // Simulated API call
    await Future.delayed(const Duration(seconds: 1));
    return UsersDto(id: id).toEntity();
  }
}
