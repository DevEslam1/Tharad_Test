import 'package:flutter/material.dart';
import '../../generated/l10n.dart';

class AppValidators {
  static String? validateEmail(BuildContext context, String? value) {
    if (value == null || value.trim().isEmpty) {
      return S.of(context).email_empty_error;
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return S.of(context).email_invalid_error;
    }
    return null;
  }

  static String? validatePassword(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return S.of(context).password_empty_error;
    }
    if (value.length < 6) {
      return S.of(context).password_too_short_error;
    }
    return null;
  }

  static String? validateName(BuildContext context, String? value) {
    if (value == null || value.trim().isEmpty) {
      return S.of(context).name_empty_error;
    }
    return null;
  }

  static String? validateConfirmPassword(BuildContext context, String? value, String password) {
    if (value == null || value.isEmpty) {
      return S.of(context).confirm_password_empty_error;
    }
    if (value != password) {
      return S.of(context).passwords_not_match_error;
    }
    return null;
  }
}
