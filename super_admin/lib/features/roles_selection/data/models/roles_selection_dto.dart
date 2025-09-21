import '../../domain/entities/roles_selection.dart';

class RolesSelectionDto {
    final int roleId;
    final String roleName;

  RolesSelectionDto({required this.roleId, required this.roleName});

  factory RolesSelectionDto.fromJson(Map<String, dynamic> json) {
    return RolesSelectionDto(roleId: json['roleId'], roleName: json['roleName']);
  }

  RolesSelection toEntity() => RolesSelection(roleId: roleId, roleName: roleName);
}
