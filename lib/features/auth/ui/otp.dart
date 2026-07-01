import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import '../../../../core/api/api_service.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_otp_field.dart';
import '../../../../core/widgets/app_toast.dart';
import '../../../../core/routing/routes.dart';
import '../../../../generated/l10n.dart';

class OtpScreen extends StatefulWidget {
  final String email;
  const OtpScreen({super.key, required this.email});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _c1 = TextEditingController();
  final _c2 = TextEditingController();
  final _c3 = TextEditingController();
  final _c4 = TextEditingController();

  final _f1 = FocusNode();
  final _f2 = FocusNode();
  final _f3 = FocusNode();
  final _f4 = FocusNode();

  int _seconds = 60;
  Timer? _timer;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds == 0) {
        timer.cancel();
      } else {
        setState(() {
          _seconds--;
        });
      }
    });
  }

  void _resend() {
    setState(() {
      _seconds = 60;
      _c1.clear();
      _c2.clear();
      _c3.clear();
      _c4.clear();
    });
    _startTimer();
    FocusScope.of(context).requestFocus(_f1);
  }

  void _confirm() async {
    final code = _c1.text + _c2.text + _c3.text + _c4.text;
    if (code.length < 4) {
      showAppToast(
        context: context,
        message: S.of(context).otp_invalid_error,
        isSuccess: false,
      );
      return;
    }

    setState(() => _isLoading = true);
    final apiService = ApiService();
    try {
      final response = await apiService.verifyOtp(
        email: widget.email,
        otp: code,
      );
      if (!mounted) return;
      setState(() => _isLoading = false);

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;
        if (data['status'] == 'success') {
          showAppToast(
            context: context,
            message: data['message'] as String? ?? S.of(context).login_success,
            isSuccess: true,
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.loginScreen,
            (route) => false,
          );
        } else {
          final msg =
              data['message'] as String? ?? S.of(context).otp_invalid_error;
          showAppToast(context: context, message: msg, isSuccess: false);
        }
      } else {
        showAppToast(
          context: context,
          message: S.of(context).otp_invalid_error,
          isSuccess: false,
        );
      }
    } catch (e) {
      if (!mounted) return;
      setState(() => _isLoading = false);
      String errMsg = S.of(context).otp_invalid_error;
      if (e is DioException) {
        final data = e.response?.data;
        if (data is Map && data['message'] != null) {
          errMsg = data['message'] as String;
        }
      } else {
        errMsg = e.toString();
      }
      showAppToast(context: context, message: errMsg, isSuccess: false);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _c1.dispose();
    _c2.dispose();
    _c3.dispose();
    _c4.dispose();
    _f1.dispose();
    _f2.dispose();
    _f3.dispose();
    _f4.dispose();
    super.dispose();
  }

  Widget _buildResendRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          S.of(context).otp_no_code,
          style: GoogleFonts.tajawal(
            fontSize: 12.sp,
            color: AppColors.textGray,
            fontWeight: FontWeight.w500,
          ),
        ),
        GestureDetector(
          onTap: _seconds == 0 ? _resend : null,
          child: Text(
            S.of(context).otp_resend_action,
            style: GoogleFonts.tajawal(
              fontSize: 12.sp,
              color: _seconds == 0
                  ? AppColors.mainColorLight
                  : AppColors.textGray.withValues(alpha: 0.5),
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
              decorationColor: _seconds == 0
                  ? AppColors.mainColorLight
                  : AppColors.textGray.withValues(alpha: 0.5),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final isAr = Localizations.localeOf(context).languageCode == 'ar';
    return Directionality(
      textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
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

                SizedBox(height: 100.h),

                Text(
                  S.of(context).otp_title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.tajawal(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),

                SizedBox(height: 8.h),

                Text(
                  S.of(context).otp_subtitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.tajawal(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textGray,
                  ),
                ),

                SizedBox(height: 32.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppOtpField(
                      controller: _c1,
                      focusNode: _f1,
                      nextFocus: _f2,
                    ),
                    SizedBox(width: 8.w),
                    AppOtpField(
                      controller: _c2,
                      focusNode: _f2,
                      nextFocus: _f3,
                      prevFocus: _f1,
                    ),
                    SizedBox(width: 8.w),
                    AppOtpField(
                      controller: _c3,
                      focusNode: _f3,
                      nextFocus: _f4,
                      prevFocus: _f2,
                    ),
                    SizedBox(width: 8.w),
                    AppOtpField(
                      controller: _c4,
                      focusNode: _f4,
                      prevFocus: _f3,
                    ),
                  ],
                ),

                SizedBox(height: 16.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: isAr
                      ? [
                          if (_seconds > 0)
                            Text(
                              '00:${_seconds.toString().padLeft(2, '0')} Sec',
                              style: GoogleFonts.tajawal(
                                fontSize: 12.sp,
                                color: AppColors.textGray,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          else
                            const SizedBox(),
                          _buildResendRow(),
                        ]
                      : [
                          _buildResendRow(),
                          if (_seconds > 0)
                            Text(
                              '00:${_seconds.toString().padLeft(2, '0')} Sec',
                              style: GoogleFonts.tajawal(
                                fontSize: 12.sp,
                                color: AppColors.textGray,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          else
                            const SizedBox(),
                        ],
                ),

                SizedBox(height: 32.h),

                AppButton(
                  text: S.of(context).otp_confirm,
                  isLoading: _isLoading,
                  onPressed: _confirm,
                ),

                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
