import 'package:dio/dio.dart';
import 'package:super_admin/core/constants/app_constants.dart';
import 'package:super_admin/core/network/interceptors/auth_interceptor.dart';

class ApiClient {
  final Dio dio;

  ApiClient({String baseUrl = ApiConstants.baseUrl})
      : dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 1000),
          receiveTimeout: const Duration(seconds: 1500),
        )) {
    // Add interceptors (logging, headers, etc.)
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
    dio.interceptors.add(AuthInterceptor(dio: dio));
  }
}
