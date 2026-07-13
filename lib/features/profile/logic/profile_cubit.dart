import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/api/api_service.dart';
import '../../../../core/caching/cache_service.dart';
import '../../../../core/network/error_handler.dart';
import '../../../../generated/l10n.dart';
import '../data/models/profile_response.dart';
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
        final profileResponse =
            ProfileResponse.fromJson(response.data as Map<String, dynamic>);
        if (profileResponse.status == 'success' && profileResponse.data != null) {
          final profileData = profileResponse.data!;
          await CacheService.saveProfile(
            username: profileData.username,
            email: profileData.email,
            imageUrl: profileData.image,
          );

          emit(ProfileGetSuccess(
            username: profileData.username,
            email: profileData.email,
            imageUrl: profileData.image,
          ));
        } else {
          throw Exception(
            profileResponse.message ?? S.current.profile_fetch_error,
          );
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
        final errorMsg = ErrorHandler.handle(e, S.current.profile_fetch_offline_error);
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
        final profileResponse =
            ProfileResponse.fromJson(response.data as Map<String, dynamic>);
        if (profileResponse.status == 'success' && profileResponse.data != null) {
          final profileData = profileResponse.data!;
          await CacheService.saveProfile(
            username: profileData.username,
            email: profileData.email,
            imageUrl: profileData.image,
          );

          emit(ProfileUpdateSuccess(
            message: profileResponse.message ?? S.current.profile_update_success,
            username: profileData.username,
            email: profileData.email,
            imageUrl: profileData.image,
          ));
        } else {
          final msg = profileResponse.message ?? S.current.profile_update_error;
          emit(ProfileFailure(msg));
        }
      } else {
        emit(ProfileFailure(S.current.profile_update_error));
      }
    } catch (e) {
      final errorMsg = ErrorHandler.handle(e, S.current.profile_update_error);
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
