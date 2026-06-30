import 'package:dio/dio.dart';
import '../network/dio_client.dart';

class ApiService {
  final Dio _dio;

  ApiService([DioClient? dioClient]) : _dio = (dioClient ?? DioClient()).dio;

  Future<Response> login({
    required String email,
    required String password,
  }) async {
    final formData = FormData.fromMap({'email': email, 'password': password});
    return await _dio.post('auth/login', data: formData);
  }

  Future<Response> logout({required String token}) async {
    return await _dio.delete(
      'auth/logout',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }

  Future<Response> register({
    required String email,
    required String username,
    required String password,
    required String passwordConfirmation,
    String? imagePath,
  }) async {
    final Map<String, dynamic> dataMap = {
      'email': email,
      'username': username,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };

    if (imagePath != null && imagePath.isNotEmpty) {
      dataMap['image'] = await MultipartFile.fromFile(
        imagePath,
        filename: imagePath.split('/').last,
      );
    }

    final formData = FormData.fromMap(dataMap);
    return await _dio.post('auth/register', data: formData);
  }

  Future<Response> verifyOtp({
    required String email,
    required String otp,
  }) async {
    return await _dio.get('otp', queryParameters: {'email': email, 'otp': otp});
  }

  Future<Response> getProfileDetails({required String token}) async {
    return await _dio.get(
      'profile-details',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }

  Future<Response> updateProfile({
    required String token,
    required String currentPassword,
    String? username,
    String? email,
    String? imagePath,
    String? newPassword,
    String? newPasswordConfirmation,
  }) async {
    final Map<String, dynamic> dataMap = {
      'password': currentPassword,
      '_method': 'PUT',
    };

    if (username != null && username.isNotEmpty) {
      dataMap['username'] = username;
    }
    if (email != null && email.isNotEmpty) {
      dataMap['email'] = email;
    }
    if (newPassword != null && newPassword.isNotEmpty) {
      dataMap['new_password'] = newPassword;
      dataMap['new_password_confirmation'] = newPasswordConfirmation ?? '';
    }

    if (imagePath != null && imagePath.isNotEmpty) {
      dataMap['image'] = await MultipartFile.fromFile(
        imagePath,
        filename: imagePath.split('/').last,
      );
    }

    final formData = FormData.fromMap(dataMap);
    return await _dio.post(
      'Update-Profile',
      data: formData,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }
}
