import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

OverlayEntry? _currentToastEntry;

void showAppToast({
  required BuildContext context,
  required String message,
  required bool isSuccess,
}) {
  if (_currentToastEntry != null) {
    try {
      _currentToastEntry!.remove();
    } catch (_) {}
    _currentToastEntry = null;
  }

  final overlayState = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: 90.h,
      left: 50.w,
      right: 50.w,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          decoration: BoxDecoration(
            color: isSuccess
                ? const Color(0xFF34C759)
                : const Color(0xFFFF3B30),
            borderRadius: BorderRadius.circular(24.r),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF000000).withValues(alpha: 0.08),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Text(
              message,
              style: GoogleFonts.alexandria(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    ),
  );

  _currentToastEntry = overlayEntry;
  overlayState.insert(overlayEntry);

  Future.delayed(const Duration(seconds: 2), () {
    if (_currentToastEntry == overlayEntry) {
      try {
        overlayEntry.remove();
      } catch (_) {}
      _currentToastEntry = null;
    }
  });
}
