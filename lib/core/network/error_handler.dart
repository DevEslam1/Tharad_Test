import 'package:dio/dio.dart';

class ErrorHandler {
  static String handle(dynamic e, String defaultErrorMsg) {
    if (e is DioException) {
      final data = e.response?.data;
      if (data is Map && data['message'] != null) {
        return data['message'] as String;
      }
      return defaultErrorMsg;
    }
    return e?.toString() ?? defaultErrorMsg;
  }
}
