import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_image_picker_field.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../core/widgets/language_switcher_button.dart';
import '../../../../core/widgets/language_bottom_sheet.dart';
import '../../../../generated/l10n.dart';

class ProfileForm extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController oldPasswordController;
  final TextEditingController newPasswordController;
  final TextEditingController confirmNewPasswordController;
  final String? imagePath;
  final bool isLoading;
  final VoidCallback onPickImage;
  final VoidCallback onSaveChanges;
  final VoidCallback onLogout;

  const ProfileForm({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.oldPasswordController,
    required this.newPasswordController,
    required this.confirmNewPasswordController,
    required this.imagePath,
    required this.isLoading,
    required this.onPickImage,
    required this.onSaveChanges,
    required this.onLogout,
  });

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  bool _isOldPasswordObscured = true;
  bool _isNewPasswordObscured = true;
  bool _isConfirmNewPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: EdgeInsets.fromLTRB(20.w, 32.h, 20.w, 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: LanguageSwitcherButton(
              label: S.of(context).language_label,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) => const LanguageBottomSheet(),
                );
              },
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            S.of(context).full_name,
            style: GoogleFonts.tajawal(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textDark,
            ),
          ),
          SizedBox(height: 6.h),
          AppTextFormField(
            controller: widget.nameController,
            hintText: S.of(context).full_name_placeholder,
            keyboardType: TextInputType.name,
          ),
          SizedBox(height: 12.h),
          Text(
            S.of(context).email,
            style: GoogleFonts.tajawal(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textDark,
            ),
          ),
          SizedBox(height: 6.h),
          AppTextFormField(
            controller: widget.emailController,
            hintText: S.of(context).email_placeholder,
            keyboardType: TextInputType.emailAddress,
            enabled: false,
          ),
          SizedBox(height: 12.h),
          AppImagePickerField(
            label: S.of(context).photo_label,
            hint: S.of(context).photo_hint,
            subHint: S.of(context).photo_sub_hint,
            imagePath: widget.imagePath,
            onTap: widget.onPickImage,
          ),
          SizedBox(height: 12.h),
          Text(
            S.of(context).old_password,
            style: GoogleFonts.tajawal(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textDark,
            ),
          ),
          SizedBox(height: 6.h),
          AppTextFormField(
            controller: widget.oldPasswordController,
            hintText: S.of(context).password_placeholder,
            obscureText: _isOldPasswordObscured,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _isOldPasswordObscured = !_isOldPasswordObscured;
                });
              },
              child: Icon(
                _isOldPasswordObscured
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: AppColors.mainColorDark,
                size: 20.r,
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            S.of(context).new_password,
            style: GoogleFonts.tajawal(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textDark,
            ),
          ),
          SizedBox(height: 6.h),
          AppTextFormField(
            controller: widget.newPasswordController,
            hintText: S.of(context).password_placeholder,
            obscureText: _isNewPasswordObscured,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _isNewPasswordObscured = !_isNewPasswordObscured;
                });
              },
              child: Icon(
                _isNewPasswordObscured
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: AppColors.mainColorDark,
                size: 20.r,
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            S.of(context).confirm_new_password,
            style: GoogleFonts.tajawal(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textDark,
            ),
          ),
          SizedBox(height: 6.h),
          AppTextFormField(
            controller: widget.confirmNewPasswordController,
            hintText: S.of(context).password_placeholder,
            obscureText: _isConfirmNewPasswordObscured,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _isConfirmNewPasswordObscured =
                      !_isConfirmNewPasswordObscured;
                });
              },
              child: Icon(
                _isConfirmNewPasswordObscured
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: AppColors.mainColorDark,
                size: 20.r,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          AppButton(
            text: S.of(context).save_changes,
            isLoading: widget.isLoading,
            onPressed: widget.onSaveChanges,
          ),
          SizedBox(height: 12.h),
          TextButton(
            onPressed: widget.onLogout,
            child: Text(
              S.of(context).logout,
              style: GoogleFonts.tajawal(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: Colors.red,
              ),
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
