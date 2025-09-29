import '../../domain/entities/users.dart';

class UsersDto {
  final String id;

  UsersDto({required this.id});

  factory UsersDto.fromJson(Map<String, dynamic> json) {
    return UsersDto(id: json['id']);
  }

  Users toEntity() => Users(id: id);
}
