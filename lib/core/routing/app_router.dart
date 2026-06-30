import 'package:tharad_app/features/auth/ui/login_screen.dart';
import 'package:tharad_app/features/auth/ui/otp.dart';
import 'package:tharad_app/features/auth/ui/singup_screen.dart';
import 'package:tharad_app/features/profile/ui/profile_screen.dart';
import 'package:flutter/material.dart';
import 'routes.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signupScreen:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case Routes.otpScreen:
        final email = settings.arguments as String? ?? '';
        return MaterialPageRoute(builder: (_) => OtpScreen(email: email));
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      default:
        return null;
    }
  }
}
