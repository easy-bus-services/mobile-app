import '../entities/users.dart';

abstract class UsersRepository {
  Future<Users> fetchUsers(String id);
}
