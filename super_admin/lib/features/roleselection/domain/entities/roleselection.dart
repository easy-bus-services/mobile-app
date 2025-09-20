class Roleselection {
  final int roleId;
  final String roleName;

  Roleselection({required this.roleId, required this.roleName});
   factory Roleselection.fromJson(Map<String, dynamic> json) {
    return Roleselection(
      roleId: json['roleId'] as int,
      roleName: json['roleName'] as String
    );
  }

  Roleselection toEntity() => Roleselection(roleId: roleId, roleName: roleName);


}
