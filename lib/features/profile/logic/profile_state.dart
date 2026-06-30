abstract class ProfileState {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  const ProfileInitial();
}

class ProfileLoading extends ProfileState {
  const ProfileLoading();
}

class ProfileGetSuccess extends ProfileState {
  final String username;
  final String email;
  final String? imageUrl;
  final bool isOffline;

  const ProfileGetSuccess({
    required this.username,
    required this.email,
    this.imageUrl,
    this.isOffline = false,
  });
}

class ProfileUpdateSuccess extends ProfileState {
  final String message;
  final String username;
  final String email;
  final String? imageUrl;

  const ProfileUpdateSuccess({
    required this.message,
    required this.username,
    required this.email,
    this.imageUrl,
  });
}

class ProfileFailure extends ProfileState {
  final String errorMessage;

  const ProfileFailure(this.errorMessage);
}

class ProfileLogoutSuccess extends ProfileState {
  const ProfileLogoutSuccess();
}
