import '../entities/auth.dart';
import '../repositories/auth_repository.dart';

class GetAuth {
  final AuthRepository repository;

  GetAuth(this.repository);

  Future<Auth> call(String id) {
    return repository.fetchAuth(id);
  }
}
