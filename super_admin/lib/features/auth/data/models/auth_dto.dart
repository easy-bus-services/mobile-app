import '../../domain/entities/auth.dart';

class AuthDto {
  final String id;

  AuthDto({required this.id});

  factory AuthDto.fromJson(Map<String, dynamic> json) {
    return AuthDto(id: json['id']);
  }

  Auth toEntity() => Auth(id: id);
}
