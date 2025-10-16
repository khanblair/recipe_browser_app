import 'package:dio/dio.dart';

class ApiConfig {
  static const baseUrl = 'https://www.themealdb.com/api/json/v1/1/';
}

class ApiClient {
  final Dio _dio;
  ApiClient({Dio? dio}) : _dio = dio ?? Dio(BaseOptions(baseUrl: ApiConfig.baseUrl));

  Dio get dio => _dio
    ..options.connectTimeout = const Duration(seconds: 10)
    ..options.receiveTimeout = const Duration(seconds: 15);
}
