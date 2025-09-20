import '../../domain/entities/roleselection.dart';

class RoleselectionDto {
  final String id;

  RoleselectionDto({required this.id});

  factory RoleselectionDto.fromJson(Map<String, dynamic> json) {
    return RoleselectionDto(id: json['id']);
  }

  Roleselection toEntity() => Roleselection(id: id);
}
