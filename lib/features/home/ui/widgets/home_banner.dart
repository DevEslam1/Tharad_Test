import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 110.h,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        gradient: const LinearGradient(
          colors: [Color(0xFF54B7BB), Color(0xFF265355)],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomPaint(size: Size(36.w, 18.h), painter: ChevronPainter()),
          SizedBox(height: 12.h),
          Text(
            S.of(context).home_banner_title,
            style: AppTextStyles.font16WhiteBold,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class ChevronPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFD6A26A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.w;

    final path1 = Path();
    path1.moveTo(0, size.height);
    path1.lineTo(size.width / 2, 0);
    path1.lineTo(size.width, size.height);
    canvas.drawPath(path1, paint);

    final path2 = Path();
    path2.moveTo(4.w, size.height);
    path2.lineTo(size.width / 2, 6.h);
    path2.lineTo(size.width - 4.w, size.height);
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
