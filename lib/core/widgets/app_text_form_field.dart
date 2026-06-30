import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theming/colors.dart';

class AppTextFormField extends StatelessWidget {
  final String? labelText;
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final TextEditingController? controller;
  final bool? enabled;
  final bool readOnly;
  final String? Function(String?)? validator;

  const AppTextFormField({
    super.key,
    this.labelText,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.errorText,
    this.controller,
    this.enabled,
    this.readOnly = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (labelText != null) ...[
          Text(
            labelText!,
            style: GoogleFonts.tajawal(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textDark,
            ),
          ),
          SizedBox(height: 6.h),
        ],
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          onChanged: onChanged,
          enabled: enabled,
          readOnly: readOnly,
          validator: validator,
          cursorColor: AppColors.mainColorDark,
          textAlign: TextAlign.right,
          style: GoogleFonts.tajawal(
            fontSize: 13.sp,
            color: AppColors.textTeal,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.tajawal(
              fontSize: 13.sp,
              color: AppColors.textTeal.withValues(alpha: 0.5),
            ),
            filled: true,
            fillColor: AppColors.fieldBg,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 14.h,
            ),
            isDense: true,
            suffixIcon: suffixIcon != null
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: SizedBox(
                      width: 20.w,
                      height: 20.h,
                      child: Center(child: suffixIcon),
                    ),
                  )
                : null,
            errorText: errorText,
            errorStyle: GoogleFonts.tajawal(fontSize: 10.sp, color: Colors.red),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppColors.fieldBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppColors.fieldBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: AppColors.mainColorLight),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
