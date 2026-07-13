import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/colors.dart';
import '../theming/styles.dart';
import '../../generated/l10n.dart';

class PasswordRequirementsWidget extends StatelessWidget {
  final String password;

  const PasswordRequirementsWidget({super.key, required this.password});

  @override
  Widget build(BuildContext context) {
    final bool hasMinLength = password.length >= 6;
    final bool hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
    final bool hasLowercase = RegExp(r'[a-z]').hasMatch(password);
    final bool hasDigits = RegExp(r'[0-9]').hasMatch(password);
    final bool hasSpecialChar =
        RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildRuleItem(
          context,
          S.of(context).password_rule_length,
          hasMinLength,
        ),
        SizedBox(height: 4.h),
        _buildRuleItem(
          context,
          S.of(context).password_rule_uppercase,
          hasUppercase,
        ),
        SizedBox(height: 4.h),
        _buildRuleItem(
          context,
          S.of(context).password_rule_lowercase,
          hasLowercase,
        ),
        SizedBox(height: 4.h),
        _buildRuleItem(
          context,
          S.of(context).password_rule_number,
          hasDigits,
        ),
        SizedBox(height: 4.h),
        _buildRuleItem(
          context,
          S.of(context).password_rule_special,
          hasSpecialChar,
        ),
      ],
    );
  }

  Widget _buildRuleItem(BuildContext context, String text, bool isMet) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          isMet ? Icons.check_circle : Icons.cancel_outlined,
          color: isMet ? AppColors.greenNormal : AppColors.textGray,
          size: 14.sp,
        ),
        SizedBox(width: 6.w),
        Text(
          text,
          style: isMet
              ? AppTextStyles.font11GreenNormalBold
              : AppTextStyles.font11TextGrayNormal,
        ),
      ],
    );
  }
}
