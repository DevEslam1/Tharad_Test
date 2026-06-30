import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/app_button.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/widgets/app_image_picker_field.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../generated/l10n.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/app_toast.dart';
import '../logic/auth_cubit.dart';
import '../logic/auth_state.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String? _imagePath;
  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isAr = Localizations.localeOf(context).languageCode == 'ar';
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Directionality(
        textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess && !state.isLogin) {
                  showAppToast(
                    context: context,
                    message: S.of(context).signup_success,
                    isSuccess: true,
                  );
                  Navigator.pushNamed(
                    context,
                    Routes.otpScreen,
                    arguments:
                        state.signupEmail ?? _emailController.text.trim(),
                  );
                } else if (state is AuthFailure) {
                  showAppToast(
                    context: context,
                    message: state.errorMessage,
                    isSuccess: false,
                  );
                }
              },
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 40.h),
                      Center(
                        child: Image.asset(
                          'assets/shared/logo.png',
                          width: 178.w,
                          height: 58.h,
                          fit: BoxFit.contain,
                        ),
                      ),

                      SizedBox(height: 40.h),

                      Center(
                        child: Text(
                          S.of(context).signup_title,
                          style: GoogleFonts.tajawal(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textDark,
                          ),
                        ),
                      ),

                      SizedBox(height: 24.h),

                      AppImagePickerField(
                        label: S.of(context).photo_label,
                        hint: S.of(context).photo_hint,
                        subHint: S.of(context).photo_sub_hint,
                        imagePath: _imagePath,
                        onTap: () => _pickImage(context),
                      ),

                      SizedBox(height: 12.h),

                      Text(
                        S.of(context).full_name,
                        style: GoogleFonts.tajawal(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textDark,
                        ),
                      ),
                      SizedBox(height: 6.h),

                      AppTextFormField(
                        controller: _nameController,
                        hintText: S.of(context).full_name_placeholder,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return S.of(context).name_empty_error;
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 12.h),

                      Text(
                        S.of(context).email,
                        style: GoogleFonts.tajawal(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textDark,
                        ),
                      ),
                      SizedBox(height: 6.h),

                      AppTextFormField(
                        controller: _emailController,
                        hintText: S.of(context).email_placeholder,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return S.of(context).email_empty_error;
                          }
                          if (!value.contains('@')) {
                            return S.of(context).email_invalid_error;
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 12.h),

                      Text(
                        S.of(context).password,
                        style: GoogleFonts.tajawal(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textDark,
                        ),
                      ),
                      SizedBox(height: 6.h),

                      AppTextFormField(
                        controller: _passwordController,
                        hintText: S.of(context).password_placeholder,
                        obscureText: _isPasswordObscured,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).password_empty_error;
                          }
                          if (value.length < 6) {
                            return S.of(context).password_too_short_error;
                          }
                          return null;
                        },
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isPasswordObscured = !_isPasswordObscured;
                            });
                          },
                          child: Icon(
                            _isPasswordObscured
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: AppColors.mainColorDark,
                            size: 20.r,
                          ),
                        ),
                      ),

                      SizedBox(height: 12.h),

                      Text(
                        S.of(context).confirm_password,
                        style: GoogleFonts.tajawal(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textDark,
                        ),
                      ),
                      SizedBox(height: 6.h),

                      AppTextFormField(
                        controller: _confirmPasswordController,
                        hintText: S.of(context).password_placeholder,
                        obscureText: _isConfirmPasswordObscured,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).confirm_password_empty_error;
                          }
                          if (value != _passwordController.text) {
                            return S.of(context).passwords_not_match_error;
                          }
                          return null;
                        },
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isConfirmPasswordObscured =
                                  !_isConfirmPasswordObscured;
                            });
                          },
                          child: Icon(
                            _isConfirmPasswordObscured
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: AppColors.mainColorDark,
                            size: 20.r,
                          ),
                        ),
                      ),

                      SizedBox(height: 24.h),

                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          return AppButton(
                            text: S.of(context).signup_button,
                            isLoading: state is AuthLoading,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthCubit>().register(
                                  name: _nameController.text.trim(),
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text,
                                  passwordConfirmation:
                                      _confirmPasswordController.text,
                                  imagePath: _imagePath,
                                );
                              }
                            },
                          );
                        },
                      ),

                      SizedBox(height: 12.h),

                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: S.of(context).have_account,
                            style: GoogleFonts.tajawal(
                              fontSize: 12.sp,
                              color: AppColors.textDark,
                            ),
                            children: [
                              TextSpan(
                                text: S.of(context).login_link,
                                style: GoogleFonts.tajawal(
                                  fontSize: 12.sp,
                                  color: AppColors.mainColorLight,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.mainColorLight,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pop(context);
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
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
}
