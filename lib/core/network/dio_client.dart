import 'package:dio/dio.dart';

class DioClient {
  static const String baseUrl = 'https://flutter.tharadtech.com/api/';
  final Dio dio;

  DioClient() : dio = Dio() {
    dio.options
      ..baseUrl = baseUrl
      ..connectTimeout = const Duration(seconds: 15)
      ..receiveTimeout = const Duration(seconds: 15)
      ..headers = {'Accept': 'application/json'};

    // Logging interceptor for debugging network calls
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
      ),
    );
  }
}
