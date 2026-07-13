import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';
import 'font_family_helper.dart';

class AppTextStyles {
  static TextStyle font22TextDarkBold = TextStyle(
    fontFamily: FontFamilyHelper.tajawal,
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
  );

  static TextStyle font20TextDarkBold = TextStyle(
    fontFamily: FontFamilyHelper.tajawal,
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
  );

  static TextStyle font20BrownBold = TextStyle(
    fontFamily: FontFamilyHelper.tajawal,
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: const Color(0xFF1F0606),
  );

  static TextStyle font18TextDarkBold = TextStyle(
    fontFamily: FontFamilyHelper.tajawal,
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
  );

  static TextStyle font16WhiteBold = TextStyle(
    fontFamily: FontFamilyHelper.tajawal,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static TextStyle font14WhiteBold = TextStyle(
    fontFamily: FontFamilyHelper.tajawal,
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static TextStyle font14RedBold = TextStyle(
    fontFamily: FontFamilyHelper.tajawal,
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: Colors.red,
  );

  static TextStyle font14TextDarkMedium = TextStyle(
    fontFamily: FontFamilyHelper.tajawal,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textDark,
  );

  static TextStyle font13TextDarkMedium = TextStyle(
    fontFamily: FontFamilyHelper.tajawal,
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textDark,
  );

  static TextStyle font13TextTealNormal = TextStyle(
    fontFamily: FontFamilyHelper.tajawal,
    fontSize: 13.sp,
    color: AppColors.textTeal,
  );

  static TextStyle font13TextTealNormal50 = TextStyle(
    fontFamily: FontFamilyHelper.tajawal,
    fontSize: 13.sp,
    color: AppColors.textTeal.withValues(alpha: 0.5),
  );

  static TextStyle font13TextDarkNormal = TextStyle(
    fontFamily: FontFamilyHelper.tajawal,
    fontSize: 13.sp,
    color: AppColors.textDark,
  );

  static TextStyle font13MainColorLightBoldUnderline = TextStyle(
    fontFamily: FontFamilyHelper.tajawal,
    fontSize: 13.sp,
    color: AppColors.mainColorLight,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.mainColorLight,
  );

  static TextStyle font12TextGrayMedium = TextStyle(
    fontFamily: FontFamilyHelper.tajawal,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textGray,
  );

  static TextStyle font12WhiteMedium = TextStyle(
    fontFamily: FontFamilyHelper.tajawal,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle font11TextDarkNormal = TextStyle(
    fontFamily: FontFamilyHelper.tajawal,
    fontSize: 11.sp,
    color: AppColors.textDark,
  );

  static TextStyle font11TextGrayNormal = TextStyle(
    fontFamily: FontFamilyHelper.tajawal,
    fontSize: 11.sp,
    color: AppColors.textGray,
  );

  static TextStyle font11GreenNormalBold = TextStyle(
    fontFamily: FontFamilyHelper.tajawal,
    fontSize: 11.sp,
    color: AppColors.greenNormal,
    fontWeight: FontWeight.bold,
  );

  static TextStyle font11GreenNormalMediumUnderline = TextStyle(
    fontFamily: FontFamilyHelper.tajawal,
    fontSize: 11.sp,
    color: AppColors.greenNormal,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.greenNormal,
  );

  static TextStyle font10TextDarkMedium = TextStyle(
    fontFamily: FontFamilyHelper.tajawal,
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textDark,
  );

  static TextStyle font10RedNormal = TextStyle(
    fontFamily: FontFamilyHelper.tajawal,
    fontSize: 10.sp,
    color: Colors.red,
  );

  static TextStyle font8TextGrayNormal = TextStyle(
    fontFamily: FontFamilyHelper.tajawal,
    fontSize: 8.sp,
    color: AppColors.textGray,
  );

  static TextStyle font6TextGrayNormal = TextStyle(
    fontFamily: FontFamilyHelper.tajawal,
    fontSize: 6.sp,
    color: AppColors.textGray,
  );
}
