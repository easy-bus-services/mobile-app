import '../../domain/entities/auth.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/auth_dto.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Auth> fetchAuth(String id) async {
    // Simulated API call
    await Future.delayed(const Duration(seconds: 1));
    return AuthDto(id: id).toEntity();
  }
}
