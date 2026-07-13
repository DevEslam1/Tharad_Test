import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../core/widgets/language_switcher_button.dart';
import '../../../../core/widgets/language_bottom_sheet.dart';
import '../../../../generated/l10n.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/app_toast.dart';
import '../../../../core/caching/cache_service.dart';
import '../../../../core/helpers/validators.dart';
import '../logic/auth_cubit.dart';
import '../logic/auth_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordObscured = true;
  bool _isRememberMeChecked = false;

  @override
  void initState() {
    super.initState();
    _isRememberMeChecked = CacheService.isRememberMe();
    if (_isRememberMeChecked) {
      _emailController.text = CacheService.getSavedEmail() ?? '';
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                if (state is AuthSuccess && state.isLogin) {
                  if (_isRememberMeChecked) {
                    CacheService.saveRememberMe(true);
                    CacheService.saveSavedEmail(_emailController.text.trim());
                  } else {
                    CacheService.saveRememberMe(false);
                    CacheService.saveSavedEmail('');
                  }
                  showAppToast(
                    context: context,
                    message: S.of(context).login_success,
                    isSuccess: true,
                  );
                  Navigator.pushReplacementNamed(context, Routes.profileScreen);
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
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: LanguageSwitcherButton(
                          label: S.of(context).language_label,
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) => const LanguageBottomSheet(),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 56.h),

                      Center(
                        child: Image.asset(
                          'assets/shared/logo.png',
                          width: 178.w,
                          height: 72.h,
                          fit: BoxFit.contain,
                        ),
                      ),

                      SizedBox(height: 64.h),

                      Center(
                        child: Text(
                          S.of(context).login_title,
                          style: GoogleFonts.tajawal(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textDark,
                          ),
                        ),
                      ),

                      SizedBox(height: 28.h),

                      Text(
                        S.of(context).email,
                        style: GoogleFonts.tajawal(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textDark,
                        ),
                      ),
                      SizedBox(height: 6.h),

                      AppTextFormField(
                        controller: _emailController,
                        hintText: S.of(context).email_placeholder,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) => AppValidators.validateEmail(context, value),
                      ),

                      SizedBox(height: 20.h),

                      Text(
                        S.of(context).password,
                        style: GoogleFonts.tajawal(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textDark,
                        ),
                      ),
                      SizedBox(height: 6.h),

                      AppTextFormField(
                        controller: _passwordController,
                        hintText: S.of(context).password_placeholder,
                        obscureText: _isPasswordObscured,
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

                      SizedBox(height: 14.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isRememberMeChecked = !_isRememberMeChecked;
                              });
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 18.r,
                                  height: 18.r,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.textDark,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(3.r),
                                    color: _isRememberMeChecked
                                        ? AppColors.mainColorDark
                                        : Colors.transparent,
                                  ),
                                  child: _isRememberMeChecked
                                      ? Icon(
                                          Icons.check,
                                          size: 12.r,
                                          color: Colors.white,
                                        )
                                      : null,
                                ),
                                SizedBox(width: 6.w),
                                Text(
                                  S.of(context).remember_me,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 11.sp,
                                    color: AppColors.textDark,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              S.of(context).forgot_password,
                              style: GoogleFonts.tajawal(
                                fontSize: 11.sp,
                                color: AppColors.greenNormal,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.greenNormal,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 44.h),

                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          return AppButton(
                            text: S.of(context).login_button,
                            isLoading: state is AuthLoading,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                final passwordError =
                                    AppValidators.validatePassword(
                                  context,
                                  _passwordController.text,
                                );
                                if (passwordError != null) {
                                  showAppToast(
                                    context: context,
                                    message: passwordError,
                                    isSuccess: false,
                                  );
                                  return;
                                }
                                context.read<AuthCubit>().login(
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text,
                                    );
                              }
                            },
                          );
                        },
                      ),

                      SizedBox(height: 24.h),

                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: S.of(context).no_account,
                            style: GoogleFonts.tajawal(
                              fontSize: 13.sp,
                              color: AppColors.textDark,
                            ),
                            children: [
                              TextSpan(
                                text: S.of(context).create_new_account,
                                style: GoogleFonts.tajawal(
                                  fontSize: 13.sp,
                                  color: AppColors.mainColorLight,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.mainColorLight,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                      context,
                                      Routes.signupScreen,
                                    );
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
}
