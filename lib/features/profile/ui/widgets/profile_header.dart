import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class ProfileHeader extends StatelessWidget {
  final int navIndex;

  const ProfileHeader({
    super.key,
    required this.navIndex,
  });

  @override
  Widget build(BuildContext context) {
    final bell = Container(
      width: 28.r,
      height: 28.r,
      decoration: BoxDecoration(
        color: const Color(0xFFE9EEEE).withValues(alpha: 0.2),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.notifications_outlined,
        color: Colors.white,
        size: 16.r,
      ),
    );

    final title = Text(
      S.of(context).profile_title,
      style: AppTextStyles.font16WhiteBold,
    );

    final balance = SizedBox(width: 28.w);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 16.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: navIndex == 1
            ? [
                Text(
                  S.of(context).home_welcome,
                  style: AppTextStyles.font16WhiteBold,
                ),
                bell,
              ]
            : [balance, title, bell],
      ),
    );
  }
}
