import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../logic/language_cubit.dart';
import '../theming/colors.dart';
import '../theming/styles.dart';
import 'app_button.dart';
import '../../generated/l10n.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  late String _selectedLanguageCode;

  @override
  void initState() {
    super.initState();
    _selectedLanguageCode = context.read<LanguageCubit>().state.languageCode;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: AppColors.fieldBg,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 48.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SizedBox(height: 20.h),

          Text(
            S.of(context).language_title,
            style: AppTextStyles.font18TextDarkBold,
          ),
          SizedBox(height: 24.h),

          _buildOptionCard(localeCode: 'ar', label: S.of(context).arabic_lang),
          SizedBox(height: 12.h),

          _buildOptionCard(localeCode: 'en', label: S.of(context).english_lang),
          SizedBox(height: 32.h),

          AppButton(
            text: S.of(context).apply_button,
            onPressed: () {
              context.read<LanguageCubit>().changeLanguage(
                _selectedLanguageCode,
              );
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOptionCard({required String localeCode, required String label}) {
    final bool isSelected = _selectedLanguageCode == localeCode;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedLanguageCode = localeCode;
        });
      },
      child: Container(
        height: 52.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.fieldBorder, width: 1.r),
        ),
        child: Row(
          children: [
            Container(
              width: 20.r,
              height: 20.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppColors.greenNormal
                      : const Color(0xFFADADAC),
                  width: 2.r,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10.r,
                        height: 10.r,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.greenNormal,
                        ),
                      ),
                    )
                  : null,
            ),
            SizedBox(width: 12.w),

            Text(
              label,
              style: AppTextStyles.font14TextDarkMedium,
            ),
          ],
        ),
      ),
    );
  }
}
