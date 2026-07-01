import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theming/colors.dart';
import '../../generated/l10n.dart';

class AppImagePickerField extends StatelessWidget {
  final String label;
  final String? hint;
  final String? subHint;
  final String? imagePath;
  final VoidCallback? onTap;

  const AppImagePickerField({
    super.key,
    required this.label,
    this.hint,
    this.subHint,
    this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final displayHint = hint ?? S.of(context).photo_hint;
    final displaySubHint = subHint ?? S.of(context).photo_sub_hint;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: GoogleFonts.tajawal(
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textDark,
          ),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 6.h),
        GestureDetector(
          onTap: onTap,
          child: imagePath != null && imagePath!.isNotEmpty
              ? Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: SizedBox(
                    width: 150.w,
                    height: 87.h,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: imagePath!.startsWith('http')
                              ? Image.network(
                                  imagePath!,
                                  width: 150.w,
                                  height: 87.h,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Center(child: Icon(Icons.error)),
                                )
                              : Image.file(
                                  File(imagePath!),
                                  width: 150.w,
                                  height: 87.h,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        Positioned(
                          top: -6.h,
                          left: -6.w,
                          child: Container(
                            width: 22.r,
                            height: 22.r,
                            decoration: const BoxDecoration(
                              color: Color(0xFF2C6062),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 12.r,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  width: double.infinity,
                  height: 87.h,
                  decoration: BoxDecoration(
                    color: AppColors.fieldBg,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: CustomPaint(
                    painter: _DashedBorder(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt_outlined,
                          size: 24.r,
                          color: AppColors.greenNormal,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          displayHint,
                          style: GoogleFonts.tajawal(
                            fontSize: 8.sp,
                            color: AppColors.textGray,
                          ),
                        ),
                        Text(
                          displaySubHint,
                          style: GoogleFonts.tajawal(
                            fontSize: 6.sp,
                            color: AppColors.textGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}

class _DashedBorder extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.greenNormal
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const dashWidth = 6.0;
    const dashSpace = 4.0;
    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          const Radius.circular(8),
        ),
      );

    for (final metric in path.computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        final end = (distance + dashWidth).clamp(0.0, metric.length);
        canvas.drawPath(metric.extractPath(distance, end), paint);
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
