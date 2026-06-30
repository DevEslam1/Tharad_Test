import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/api/api_service.dart';
import '../../../../core/caching/cache_service.dart';
import '../../../../generated/l10n.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ApiService _apiService = ApiService();

  ProfileCubit() : super(const ProfileInitial());

  Future<void> fetchProfile() async {
    final token = CacheService.getToken();
    if (token == null) {
      emit(ProfileFailure(S.current.no_session_error));
      return;
    }

    emit(const ProfileLoading());

    try {
      final response = await _apiService.getProfileDetails(token: token);
      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;
        if (data['status'] == 'success') {
          final username = data['data']['username'] as String;
          final email = data['data']['email'] as String;
          final imageUrl = data['data']['image'] as String?;

          await CacheService.saveProfile(
            username: username,
            email: email,
            imageUrl: imageUrl,
          );

          emit(ProfileGetSuccess(
            username: username,
            email: email,
            imageUrl: imageUrl,
          ));
        } else {
          throw Exception(data['message'] ?? S.current.profile_fetch_error);
        }
      } else {
        throw Exception(S.current.profile_fetch_error);
      }
    } catch (e) {
      final cachedUsername = CacheService.getUsername();
      final cachedEmail = CacheService.getEmail();
      final cachedImage = CacheService.getImageUrl();

      if (cachedUsername != null && cachedEmail != null) {
        emit(ProfileGetSuccess(
          username: cachedUsername,
          email: cachedEmail,
          imageUrl: cachedImage,
          isOffline: true,
        ));
      } else {
        String errorMsg = S.current.profile_fetch_offline_error;
        if (e is DioException) {
          final data = e.response?.data;
          if (data is Map && data['message'] != null) {
            errorMsg = data['message'] as String;
          }
        } else {
          errorMsg = e.toString();
        }
        emit(ProfileFailure(errorMsg));
      }
    }
  }

  Future<void> updateProfile({
    required String currentPassword,
    String? username,
    String? email,
    String? imagePath,
    String? newPassword,
    String? newPasswordConfirmation,
  }) async {
    final token = CacheService.getToken();
    if (token == null) {
      emit(const ProfileFailure('No session found.'));
      return;
    }

    emit(const ProfileLoading());

    try {
      final bool isLocalImage =
          imagePath != null &&
          !imagePath.startsWith('http') &&
          imagePath.isNotEmpty;

      final response = await _apiService.updateProfile(
        token: token,
        currentPassword: currentPassword,
        username: username,
        email: email,
        imagePath: isLocalImage ? imagePath : null,
        newPassword: newPassword,
        newPasswordConfirmation: newPasswordConfirmation,
      );

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;
        if (data['status'] == 'success') {
          final updatedUser = data['data'];
          final updatedUsername = updatedUser['username'] as String;
          final updatedEmail = updatedUser['email'] as String;
          final updatedImage = updatedUser['image'] as String?;

          await CacheService.saveProfile(
            username: updatedUsername,
            email: updatedEmail,
            imageUrl: updatedImage,
          );

          emit(ProfileUpdateSuccess(
            message: data['message'] as String? ?? S.current.profile_update_success,
            username: updatedUsername,
            email: updatedEmail,
            imageUrl: updatedImage,
          ));
        } else {
          final msg = data['message'] as String? ?? S.current.profile_update_error;
          emit(ProfileFailure(msg));
        }
      } else {
        emit(ProfileFailure(S.current.profile_update_error));
      }
    } catch (e) {
      String errorMsg = S.current.profile_update_error;
      if (e is DioException) {
        final data = e.response?.data;
        if (data is Map && data['message'] != null) {
          errorMsg = data['message'] as String;
        }
      } else {
        errorMsg = e.toString();
      }
      emit(ProfileFailure(errorMsg));
    }
  }

  Future<void> logout() async {
    final token = CacheService.getToken() ?? '';
    emit(const ProfileLoading());

    try {
      await _apiService.logout(token: token);
    } catch (_) {}

    await CacheService.clearSession();
    emit(const ProfileLogoutSuccess());
  }
}
