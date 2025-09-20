import '../../domain/entities/roleselection.dart';

class RoleselectionDto {
    final int roleId;
    final String roleName;

  RoleselectionDto({required this.roleId, required this.roleName});

  factory RoleselectionDto.fromJson(Map<String, dynamic> json) {
    return RoleselectionDto(roleId: json['roleId'], roleName: json['roleName']);
  }

  Roleselection toEntity() => Roleselection(roleId: roleId, roleName: roleName);
}
