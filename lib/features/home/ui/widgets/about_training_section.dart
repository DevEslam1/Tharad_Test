import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../generated/l10n.dart';

class AboutTrainingSection extends StatelessWidget {
  const AboutTrainingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          S.of(context).about_training_title,
          style: GoogleFonts.tajawal(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1F0606),
          ),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 12.h),
        Text(
          S.of(context).about_training_content,
          style: GoogleFonts.tajawal(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF998C8C),
            height: 1.5,
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
