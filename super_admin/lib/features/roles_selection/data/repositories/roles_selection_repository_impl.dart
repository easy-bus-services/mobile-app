// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:super_admin/core/constants/app_constants.dart';
import 'package:super_admin/core/network/api_client.dart';

import '../../domain/entities/roles_selection.dart';
import '../../domain/repositories/roles_selection_repository.dart';
import '../models/roles_selection_dto.dart';

class RolesSelectionRepositoryImpl implements RolesSelectionRepository {
  final ApiClient apiClient;

  RolesSelectionRepositoryImpl(this.apiClient);

  @override
  Future<List<RolesSelection>> fetchRoles() async {
      try {
      final response = await apiClient.dio.get(ApiConstants.getAllRoles);

      if (response.statusCode == 200) {
        print("============================================================");
       // final responseDto = ResponseDto.fromJson(response.data);
       // print(responseDto.data);
        print((response.data).runtimeType);
        print("repo");
        //print(jsonDecode(response.data) as List);
        final List<dynamic> jsonList = response.data ?? [];
        final List<RolesSelection> items = List<RolesSelection>.from(jsonList.map((json) => RolesSelection.fromJson(json)));
  
        print(jsonList[0]);
        final dto = items[0];        
        //final dto = jsonList[0];        
        print(dto.roleName);
        return items;
      } else {
        throw Exception("Failed to load user: \${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("API error: \${e.message}");
    }
  }
}
