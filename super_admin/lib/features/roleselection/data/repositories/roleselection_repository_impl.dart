import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:super_admin/core/constants/app_constants.dart';
import 'package:super_admin/core/models/response_dto.dart';
import 'package:super_admin/core/network/api_client.dart';

import '../../domain/entities/roleselection.dart';
import '../../domain/repositories/roleselection_repository.dart';
import '../models/roleselection_dto.dart';

class RoleselectionRepositoryImpl implements RoleselectionRepository {
  
  final ApiClient apiClient;

  RoleselectionRepositoryImpl(this.apiClient);
  
  @override
  Future<List<Roleselection>> getAllRoles() async {
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
        final List<Roleselection> items = List<Roleselection>.from(jsonList.map((json) => Roleselection.fromJson(json)));
  
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
