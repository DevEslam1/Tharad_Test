import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/api/api_service.dart';
import '../../../../core/caching/cache_service.dart';
import '../../../../generated/l10n.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final ApiService _apiService = ApiService();

  AuthCubit() : super(const AuthInitial());

  Future<void> login({required String email, required String password}) async {
    emit(const AuthLoading());

    try {
      final response = await _apiService.login(
        email: email,
        password: password,
      );

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;
        if (data['status'] == 'success') {
          final token = data['data']['token'] as String;
          final username = data['data']['username'] as String;
          final userEmail = data['data']['email'] as String;

          // Save to Hive (which is now encrypted)
          await CacheService.saveToken(token);
          await CacheService.saveProfile(username: username, email: userEmail);

          emit(AuthSuccess(token: token, isLogin: true));
        } else {
          final msg = data['message'] as String? ?? S.current.login_failure;
          emit(AuthFailure(msg));
        }
      } else {
        emit(AuthFailure(S.current.login_failure));
      }
    } catch (e) {
      String errorMsg = S.current.login_failure;
      if (e is DioException) {
        final data = e.response?.data;
        if (data is Map && data['message'] != null) {
          errorMsg = data['message'] as String;
        }
      } else {
        errorMsg = e.toString();
      }
      emit(AuthFailure(errorMsg));
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    String? imagePath,
  }) async {
    emit(const AuthLoading());

    try {
      final response = await _apiService.register(
        email: email.trim(),
        username: name.trim(),
        password: password,
        passwordConfirmation: passwordConfirmation,
        imagePath: imagePath,
      );

      if (response.statusCode == 201 && response.data != null) {
        final data = response.data;
        if (data['status'] == 'success') {
          emit(AuthSuccess(signupEmail: email, isLogin: false));
        } else {
          final msg = data['message'] as String? ?? S.current.signup_failure;
          emit(AuthFailure(msg));
        }
      } else {
        emit(AuthFailure(S.current.signup_failure));
      }
    } catch (e) {
      String errorMsg = S.current.signup_failure;
      if (e is DioException) {
        final data = e.response?.data;
        if (data is Map && data['message'] != null) {
          errorMsg = data['message'] as String;
        }
      } else {
        errorMsg = e.toString();
      }
      emit(AuthFailure(errorMsg));
    }
  }
}
