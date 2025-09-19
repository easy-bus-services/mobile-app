import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;

  ApiClient({String baseUrl = "http://184.168.126.83:8080/backend/api/"})
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
  }
}
