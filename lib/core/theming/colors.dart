import 'package:flutter/material.dart';

class AppColors {
  static const Color mainColorDark = Color(0xFF265355);
  static const Color mainColorLight = Color(0xFF54B7BB);

  static const Color textDark = Color(0xFF0D1D1E);
  static const Color textTeal = Color(0xFF265355);
  static const Color textGray = Color(0xFF998C8C);

  static const Color greenNormal = Color(0xFF42867B);

  static const Color fieldBg = Color(0xFFF4F7F6);
  static const Color fieldBorder = Color(0xFFF0E6DE);

  static const LinearGradient mainGradient = LinearGradient(
    colors: [mainColorLight, mainColorDark],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [-0.0618, 1.0008],
  );
}
