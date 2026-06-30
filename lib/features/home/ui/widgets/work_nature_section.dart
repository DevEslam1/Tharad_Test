import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../generated/l10n.dart';

class WorkNatureSection extends StatelessWidget {
  const WorkNatureSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          S.of(context).work_nature_title,
          style: GoogleFonts.tajawal(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1F0606),
          ),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 16.h),
        _buildBulletItem(context, S.of(context).work_nature_item_1),
        _buildBulletItem(context, S.of(context).work_nature_item_2),
        _buildBulletItem(context, S.of(context).work_nature_item_3),
        _buildBulletItem(context, S.of(context).work_nature_item_4),
        _buildBulletItem(context, S.of(context).work_nature_item_5),
      ],
    );
  }

  Widget _buildBulletItem(BuildContext context, String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 16.r,
            height: 16.r,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFF54B7BB), Color(0xFF265355)],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.tajawal(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF998C8C),
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
