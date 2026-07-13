import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/styles.dart';
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
          style: AppTextStyles.font20BrownBold,
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 12.h),
        Text(
          S.of(context).about_training_content,
          style: AppTextStyles.font12TextGrayMedium.copyWith(height: 1.5),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
