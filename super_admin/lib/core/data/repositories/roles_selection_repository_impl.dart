// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:super_admin/core/constants/app_constants.dart';
import 'package:super_admin/core/models/response_dto.dart';
import 'package:super_admin/core/network/api_client.dart';

import '../../domain/entities/roles_selection.dart';
import '../../domain/repositories/roles_selection_repository.dart';
Logger? _logger;
class RolesSelectionRepositoryImpl implements RolesSelectionRepository {
  final ApiClient apiClient;

  RolesSelectionRepositoryImpl(this.apiClient);

  @override
  Future<List<RolesSelection>> fetchRoles() async {
      try {
      final response = await apiClient.dio.get(ApiConstants.getAllRoles);

      if (response.statusCode == 200) {
         _logger?.i("============================================================");
       // final responseDto = ResponseDto.fromJson(response.data);
       //  _logger?.i(responseDto.data);
         _logger?.i((response.data).runtimeType);
         _logger?.i("repo");
        // _logger?.i(jsonDecode(response.data) as List);
        final List<dynamic> jsonList = response.data ?? [];
        final List<RolesSelection> items = List<RolesSelection>.from(jsonList.map((json) => RolesSelection.fromJson(json)));
  
         _logger?.i(jsonList[0]);
        final dto = items[0];        
        //final dto = jsonList[0];        
         _logger?.i(dto.roleName);
        return items;
      } else {
        throw Exception("Failed to load user: \${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("API error: ${e.message}");
    }
  }

  @override
  Future<RolesSelection> deleteRole(int roleId) async {
    try {
      final response = await apiClient.dio.delete(ApiConstants.deleteRole+roleId.toString());
      print("delete role id $roleId");
      if (response.statusCode == 200) {
        print(response);
         final responseDto = response.data as Map<String, dynamic>;
        print(responseDto['message']);
        _logger?.i((response.data).runtimeType);
        _logger?.i("repo");
        // _logger?.i(jsonDecode(response.data) as List);
       // final List<dynamic> jsonList = response.data ?? [];
        //final List<RolesSelection> items = List<RolesSelection>.from(jsonList.map((json) => RolesSelection.fromJson(json)));

        //_logger?.i(jsonList[0]);
        //final dto = items[0];
        //final dto = jsonList[0];
        //_logger?.i(dto.roleName);
        return new RolesSelection(roleId: 1, roleName: 'roleName');
      } else {
        throw Exception("Failed to load user: \${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("API error: ${e.message}");
    }
  }
}
