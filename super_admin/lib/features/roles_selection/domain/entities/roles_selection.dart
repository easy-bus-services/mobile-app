class RolesSelection {
  final int roleId;
  final String roleName;

  RolesSelection({required this.roleId, required this.roleName});

  factory RolesSelection.fromJson(Map<String, dynamic> json) {
    return RolesSelection(
      roleId: json['roleId'] as int,
      roleName: json['roleName'] as String
    );
  }

  RolesSelection toEntity() => RolesSelection(roleId: roleId, roleName: roleName);
}
