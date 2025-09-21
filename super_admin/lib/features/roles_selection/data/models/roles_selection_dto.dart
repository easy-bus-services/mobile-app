import '../../domain/entities/roles_selection.dart';

class RolesSelectionDto {
  final String id;

  RolesSelectionDto({required this.id});

  factory RolesSelectionDto.fromJson(Map<String, dynamic> json) {
    return RolesSelectionDto(id: json['id']);
  }

  RolesSelection toEntity() => RolesSelection(id: id);
}
