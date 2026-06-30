import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theming/colors.dart';

class LanguageSwitcherButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const LanguageSwitcherButton({super.key, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.language, size: 18.r, color: AppColors.greenNormal),
          SizedBox(width: 6.w),
          Text(
            label,
            style: GoogleFonts.tajawal(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }
}
