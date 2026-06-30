import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/about_training_section.dart';
import 'widgets/home_banner.dart';
import 'widgets/work_nature_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: EdgeInsets.fromLTRB(20.w, 32.h, 20.w, 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const HomeBanner(),
          SizedBox(height: 20.h),
          const AboutTrainingSection(),
          SizedBox(height: 24.h),
          const WorkNatureSection(),
        ],
      ),
    );
  }
}
