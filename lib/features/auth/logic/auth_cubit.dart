import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/api/api_service.dart';
import '../../../../core/caching/cache_service.dart';
import '../../../../core/network/error_handler.dart';
import '../../../../generated/l10n.dart';
import '../data/models/login_response.dart';
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
        final loginResponse =
            LoginResponse.fromJson(response.data as Map<String, dynamic>);
        if (loginResponse.status == 'success' && loginResponse.data != null) {
          final loginData = loginResponse.data!;
          await CacheService.saveToken(loginData.token);
          await CacheService.saveProfile(
            username: loginData.username,
            email: loginData.email,
          );
          emit(AuthSuccess(token: loginData.token, isLogin: true));
        } else {
          final msg = loginResponse.message ?? S.current.login_failure;
          emit(AuthFailure(msg));
        }
      } else {
        emit(AuthFailure(S.current.login_failure));
      }
    } catch (e) {
      final errorMsg = ErrorHandler.handle(e, S.current.login_failure);
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
      final errorMsg = ErrorHandler.handle(e, S.current.signup_failure);
      emit(AuthFailure(errorMsg));
    }
  }
}
