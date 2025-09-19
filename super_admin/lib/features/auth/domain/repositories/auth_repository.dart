import '../entities/auth.dart';

abstract class AuthRepository {
  Future<Auth> fetchAuth(String id);
}
