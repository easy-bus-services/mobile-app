import '../entities/users.dart';
import '../repositories/users_repository.dart';

class GetUsers {
  final UsersRepository repository;

  GetUsers(this.repository);

  Future<Users> call(String id) {
    return repository.fetchUsers(id);
  }
}
