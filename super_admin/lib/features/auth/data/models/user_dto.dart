import '../../domain/entities/user.dart';

class UserDto {
  final int? id;
  final String fullName;
  final String email;

  UserDto({required this.id, required this.fullName, required this.email});

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
    );
  }

  User toEntity() => User(id: id.toString(), email: email, fullName: fullName);
}
