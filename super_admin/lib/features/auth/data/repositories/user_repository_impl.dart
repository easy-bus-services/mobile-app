import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:super_admin/core/models/response_dto.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../models/user_dto.dart';
import '../../../../core/network/api_client.dart';

class UserRepositoryImpl implements UserRepository {
  final ApiClient apiClient;

  UserRepositoryImpl(this.apiClient);

  @override
  Future<User> fetchUser(String id) async {
    try {
      final response = await apiClient.dio.get("/users/$id");

      if (response.statusCode == 200) {
        print("============================================================");
       // final responseDto = ResponseDto.fromJson(response.data);
       // print(responseDto.data);
        final dto = UserDto.fromJson(ResponseDto.fromJson(response.data).data);        
       // print(dto.fullName);
        return dto.toEntity();
      } else {
        throw Exception("Failed to load user: \${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("API error: \${e.message}");
    }
  }
}
