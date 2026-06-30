import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/caching/cache_service.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/app_bottom_nav_bar.dart';
import '../../../../core/widgets/app_toast.dart';
import '../../../../generated/l10n.dart';
import '../../home/ui/home_screen.dart';
import '../logic/profile_cubit.dart';
import '../logic/profile_state.dart';
import 'widgets/profile_form.dart';
import 'widgets/profile_header.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isLoading = false;
  int _navIndex = 1;

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _oldPasswordController;
  late TextEditingController _newPasswordController;
  late TextEditingController _confirmNewPasswordController;
  String? _imagePath;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: CacheService.getUsername() ?? '',
    );
    _emailController = TextEditingController(
      text: CacheService.getEmail() ?? '',
    );
    _oldPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmNewPasswordController = TextEditingController();
    _imagePath = CacheService.getImageUrl();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }

  void _saveChanges(BuildContext context) async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final oldPassword = _oldPasswordController.text;
    final newPassword = _newPasswordController.text;
    final confirmNewPassword = _confirmNewPasswordController.text;

    if (oldPassword.isEmpty) {
      showAppToast(
        context: context,
        message: S.of(context).password_empty_error,
        isSuccess: false,
      );
      return;
    }

    if (newPassword.isNotEmpty) {
      if (newPassword.length < 6) {
        showAppToast(
          context: context,
          message: S.of(context).password_too_short_error,
          isSuccess: false,
        );
        return;
      }
      if (newPassword != confirmNewPassword) {
        showAppToast(
          context: context,
          message: S.of(context).passwords_not_match_error,
          isSuccess: false,
        );
        return;
      }
    }

    if (_imagePath != null && !_imagePath!.startsWith('http') && _imagePath!.isNotEmpty) {
      final bytes = await File(_imagePath!).length();
      final megaBytes = bytes / (1024 * 1024);
      if (!context.mounted) return;
      if (megaBytes > 5) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('حجم الصورة يجب أن يكون أقل من 5 ميجابايت'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
    }

    if (!context.mounted) return;
    context.read<ProfileCubit>().updateProfile(
          currentPassword: oldPassword,
          username: name,
          email: email,
          imagePath: _imagePath,
          newPassword: newPassword.isNotEmpty ? newPassword : null,
          newPasswordConfirmation:
              newPassword.isNotEmpty ? confirmNewPassword : null,
        );
  }

  void _pickImage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (bottomSheetContext) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('معرض الصور / Gallery'),
              onTap: () async {
                Navigator.pop(bottomSheetContext);
                await _processImagePick(context, ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('الكاميرا / Camera'),
              onTap: () async {
                Navigator.pop(bottomSheetContext);
                await _processImagePick(context, ImageSource.camera);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _processImagePick(
    BuildContext context,
    ImageSource source,
  ) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? file = await picker.pickImage(source: source);
      if (file == null) return;

      final int sizeBytes = await file.length();
      const int maxBytes = 5 * 1024 * 1024;
      if (sizeBytes > maxBytes) {
        if (context.mounted) {
          showAppToast(
            context: context,
            message: 'حجم الصورة يتعدى 5 ميجابايت / Size exceeds 5MB',
            isSuccess: false,
          );
        }
        return;
      }

      if (context.mounted) {
        setState(() {
          _imagePath = file.path;
        });
      }
    } catch (e) {
      if (context.mounted) {
        showAppToast(context: context, message: e.toString(), isSuccess: false);
      }
    }
  }

  void _logout(BuildContext context) {
    context.read<ProfileCubit>().logout();
  }

  @override
  Widget build(BuildContext context) {
    final isAr = Localizations.localeOf(context).languageCode == 'ar';
    return BlocProvider(
      create: (context) => ProfileCubit()..fetchProfile(),
      child: Directionality(
        textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
        child: Scaffold(
          body: BlocListener<ProfileCubit, ProfileState>(
            listener: (context, state) {
              if (state is ProfileLoading) {
                setState(() => _isLoading = true);
              } else if (state is ProfileGetSuccess) {
                setState(() {
                  _isLoading = false;
                  _nameController.text = state.username;
                  _emailController.text = state.email;
                  if (state.imageUrl != null) {
                    _imagePath = state.imageUrl;
                  }
                });
                if (state.isOffline) {
                  showAppToast(
                    context: context,
                    message: isAr ? 'أنت تعمل في وضع الأوفلاين' : 'You are working in offline mode',
                    isSuccess: false,
                  );
                }
              } else if (state is ProfileUpdateSuccess) {
                setState(() {
                  _isLoading = false;
                  _oldPasswordController.clear();
                  _newPasswordController.clear();
                  _confirmNewPasswordController.clear();
                  if (state.imageUrl != null) {
                    _imagePath = state.imageUrl;
                  }
                });
                showAppToast(
                  context: context,
                  message: state.message,
                  isSuccess: true,
                );
              } else if (state is ProfileFailure) {
                setState(() => _isLoading = false);
                showAppToast(
                  context: context,
                  message: state.errorMessage,
                  isSuccess: false,
                );
              } else if (state is ProfileLogoutSuccess) {
                setState(() => _isLoading = false);
                showAppToast(
                  context: context,
                  message: S.of(context).logout_success,
                  isSuccess: true,
                );
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.loginScreen,
                  (route) => false,
                );
              }
            },
            child: Container(
              decoration: const BoxDecoration(gradient: AppColors.mainGradient),
              child: SafeArea(
                child: Column(
                  children: [
                    ProfileHeader(navIndex: _navIndex),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16.r),
                          ),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: _navIndex == 1
                                  ? const HomeScreen()
                                  : Builder(
                                      builder: (context) {
                                        return ProfileForm(
                                          nameController: _nameController,
                                          emailController: _emailController,
                                          oldPasswordController:
                                              _oldPasswordController,
                                          newPasswordController:
                                              _newPasswordController,
                                          confirmNewPasswordController:
                                              _confirmNewPasswordController,
                                          imagePath: _imagePath,
                                          isLoading: _isLoading,
                                          onPickImage: () =>
                                              _pickImage(context),
                                          onSaveChanges: () =>
                                              _saveChanges(context),
                                          onLogout: () => _logout(context),
                                        );
                                      },
                                    ),
                            ),
                            AppBottomNavBar(
                              currentIndex: _navIndex,
                              onTap: (index) {
                                setState(() => _navIndex = index);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
