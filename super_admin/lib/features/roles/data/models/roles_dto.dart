import '../../domain/entities/roles.dart';

class RolesDto {
  final String id;

  RolesDto({required this.id});

  factory RolesDto.fromJson(Map<String, dynamic> json) {
    return RolesDto(id: json['id']);
  }

  Roles toEntity() => Roles(id: id);
}
