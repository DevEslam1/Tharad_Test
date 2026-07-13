// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `تسجيل الدخول`
  String get login_title {
    return Intl.message(
      'تسجيل الدخول',
      name: 'login_title',
      desc: '',
      args: [],
    );
  }

  /// `البريد الإلكتروني`
  String get email {
    return Intl.message(
      'البريد الإلكتروني',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Tharad@gmail.com`
  String get email_placeholder {
    return Intl.message(
      'Tharad@gmail.com',
      name: 'email_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور`
  String get password {
    return Intl.message(
      'كلمة المرور',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `••••••••••••`
  String get password_placeholder {
    return Intl.message(
      '••••••••••••',
      name: 'password_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `تذكرني`
  String get remember_me {
    return Intl.message(
      'تذكرني',
      name: 'remember_me',
      desc: '',
      args: [],
    );
  }

  /// `هل نسيت كلمة المرور؟`
  String get forgot_password {
    return Intl.message(
      'هل نسيت كلمة المرور؟',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الدخول`
  String get login_button {
    return Intl.message(
      'تسجيل الدخول',
      name: 'login_button',
      desc: '',
      args: [],
    );
  }

  /// `ليس لديك حساب؟ `
  String get no_account {
    return Intl.message(
      'ليس لديك حساب؟ ',
      name: 'no_account',
      desc: '',
      args: [],
    );
  }

  /// `إنشاء حساب جديد`
  String get create_new_account {
    return Intl.message(
      'إنشاء حساب جديد',
      name: 'create_new_account',
      desc: '',
      args: [],
    );
  }

  /// `البريد الإلكتروني مطلوب`
  String get email_empty_error {
    return Intl.message(
      'البريد الإلكتروني مطلوب',
      name: 'email_empty_error',
      desc: '',
      args: [],
    );
  }

  /// `الرجاء إدخال بريد إلكتروني صحيح`
  String get email_invalid_error {
    return Intl.message(
      'الرجاء إدخال بريد إلكتروني صحيح',
      name: 'email_invalid_error',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور مطلوبة`
  String get password_empty_error {
    return Intl.message(
      'كلمة المرور مطلوبة',
      name: 'password_empty_error',
      desc: '',
      args: [],
    );
  }

  /// `يجب أن تكون كلمة المرور 6 أحرف على الأقل`
  String get password_too_short_error {
    return Intl.message(
      'يجب أن تكون كلمة المرور 6 أحرف على الأقل',
      name: 'password_too_short_error',
      desc: '',
      args: [],
    );
  }

  /// `تم تسجيل الدخول بنجاح`
  String get login_success {
    return Intl.message(
      'تم تسجيل الدخول بنجاح',
      name: 'login_success',
      desc: '',
      args: [],
    );
  }

  /// `البريد الإلكتروني أو كلمة المرور غير صحيحة`
  String get login_failure {
    return Intl.message(
      'البريد الإلكتروني أو كلمة المرور غير صحيحة',
      name: 'login_failure',
      desc: '',
      args: [],
    );
  }

  /// `إنشاء حساب جديد`
  String get signup_title {
    return Intl.message(
      'إنشاء حساب جديد',
      name: 'signup_title',
      desc: '',
      args: [],
    );
  }

  /// `الاسم الكامل`
  String get full_name {
    return Intl.message(
      'الاسم الكامل',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `أحمد علي`
  String get full_name_placeholder {
    return Intl.message(
      'أحمد علي',
      name: 'full_name_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `تأكيد كلمة المرور`
  String get confirm_password {
    return Intl.message(
      'تأكيد كلمة المرور',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `إنشاء الحساب`
  String get signup_button {
    return Intl.message(
      'إنشاء الحساب',
      name: 'signup_button',
      desc: '',
      args: [],
    );
  }

  /// `لديك حساب بالفعل؟ `
  String get have_account {
    return Intl.message(
      'لديك حساب بالفعل؟ ',
      name: 'have_account',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الدخول`
  String get login_link {
    return Intl.message(
      'تسجيل الدخول',
      name: 'login_link',
      desc: '',
      args: [],
    );
  }

  /// `الصورة الشخصية`
  String get photo_label {
    return Intl.message(
      'الصورة الشخصية',
      name: 'photo_label',
      desc: '',
      args: [],
    );
  }

  /// `اضغط لتحميل الصورة`
  String get photo_hint {
    return Intl.message(
      'اضغط لتحميل الصورة',
      name: 'photo_hint',
      desc: '',
      args: [],
    );
  }

  /// `PNG, JPG`
  String get photo_sub_hint {
    return Intl.message(
      'PNG, JPG',
      name: 'photo_sub_hint',
      desc: '',
      args: [],
    );
  }

  /// `الاسم مطلوب`
  String get name_empty_error {
    return Intl.message(
      'الاسم مطلوب',
      name: 'name_empty_error',
      desc: '',
      args: [],
    );
  }

  /// `تأكيد كلمة المرور مطلوب`
  String get confirm_password_empty_error {
    return Intl.message(
      'تأكيد كلمة المرور مطلوب',
      name: 'confirm_password_empty_error',
      desc: '',
      args: [],
    );
  }

  /// `كلمتا المرور غير متطابقتين`
  String get passwords_not_match_error {
    return Intl.message(
      'كلمتا المرور غير متطابقتين',
      name: 'passwords_not_match_error',
      desc: '',
      args: [],
    );
  }

  /// `تم إنشاء الحساب بنجاح`
  String get signup_success {
    return Intl.message(
      'تم إنشاء الحساب بنجاح',
      name: 'signup_success',
      desc: '',
      args: [],
    );
  }

  /// `حدث خطأ، يرجى المحاولة مرة أخرى`
  String get signup_failure {
    return Intl.message(
      'حدث خطأ، يرجى المحاولة مرة أخرى',
      name: 'signup_failure',
      desc: '',
      args: [],
    );
  }

  /// `رمز التحقق`
  String get otp_title {
    return Intl.message(
      'رمز التحقق',
      name: 'otp_title',
      desc: '',
      args: [],
    );
  }

  /// `لاستكمال فتح حسابك ادخل رمز التحقق المرسل عبر البريد الإلكتروني`
  String get otp_subtitle {
    return Intl.message(
      'لاستكمال فتح حسابك ادخل رمز التحقق المرسل عبر البريد الإلكتروني',
      name: 'otp_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `إعادة الإرسال`
  String get otp_resend {
    return Intl.message(
      'إعادة الإرسال',
      name: 'otp_resend',
      desc: '',
      args: [],
    );
  }

  /// `المتابعة`
  String get otp_confirm {
    return Intl.message(
      'المتابعة',
      name: 'otp_confirm',
      desc: '',
      args: [],
    );
  }

  /// `لم يصلك رمز ؟ `
  String get otp_no_code {
    return Intl.message(
      'لم يصلك رمز ؟ ',
      name: 'otp_no_code',
      desc: '',
      args: [],
    );
  }

  /// `إعادة إرسال`
  String get otp_resend_action {
    return Intl.message(
      'إعادة إرسال',
      name: 'otp_resend_action',
      desc: '',
      args: [],
    );
  }

  /// `إعادة الإرسال بعد {seconds} ث`
  String otp_resend_timer(int seconds) {
    return Intl.message(
      'إعادة الإرسال بعد $seconds ث',
      name: 'otp_resend_timer',
      desc: '',
      args: [seconds],
    );
  }

  /// `الرمز غير صحيح`
  String get otp_invalid_error {
    return Intl.message(
      'الرمز غير صحيح',
      name: 'otp_invalid_error',
      desc: '',
      args: [],
    );
  }

  /// `الملف الشخصي`
  String get profile_title {
    return Intl.message(
      'الملف الشخصي',
      name: 'profile_title',
      desc: '',
      args: [],
    );
  }

  /// `حفظ التغييرات`
  String get save_changes {
    return Intl.message(
      'حفظ التغييرات',
      name: 'save_changes',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور القديمة`
  String get old_password {
    return Intl.message(
      'كلمة المرور القديمة',
      name: 'old_password',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور الجديدة`
  String get new_password {
    return Intl.message(
      'كلمة المرور الجديدة',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `تأكيد كلمة المرور الجديدة`
  String get confirm_new_password {
    return Intl.message(
      'تأكيد كلمة المرور الجديدة',
      name: 'confirm_new_password',
      desc: '',
      args: [],
    );
  }

  /// `الرئيسية`
  String get home {
    return Intl.message(
      'الرئيسية',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `حسابي`
  String get my_account {
    return Intl.message(
      'حسابي',
      name: 'my_account',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get language_label {
    return Intl.message(
      'English',
      name: 'language_label',
      desc: '',
      args: [],
    );
  }

  /// `اللغة`
  String get language_title {
    return Intl.message(
      'اللغة',
      name: 'language_title',
      desc: '',
      args: [],
    );
  }

  /// `اللغة العربية`
  String get arabic_lang {
    return Intl.message(
      'اللغة العربية',
      name: 'arabic_lang',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english_lang {
    return Intl.message(
      'English',
      name: 'english_lang',
      desc: '',
      args: [],
    );
  }

  /// `تطبيق`
  String get apply_button {
    return Intl.message(
      'تطبيق',
      name: 'apply_button',
      desc: '',
      args: [],
    );
  }

  /// `مرحبا ثراد تك !`
  String get home_welcome {
    return Intl.message(
      'مرحبا ثراد تك !',
      name: 'home_welcome',
      desc: '',
      args: [],
    );
  }

  /// `تدريب Flutter لبناء تطبيقات موبايل حقيقية`
  String get home_banner_title {
    return Intl.message(
      'تدريب Flutter لبناء تطبيقات موبايل حقيقية',
      name: 'home_banner_title',
      desc: '',
      args: [],
    );
  }

  /// `عن التدريب`
  String get about_training_title {
    return Intl.message(
      'عن التدريب',
      name: 'about_training_title',
      desc: '',
      args: [],
    );
  }

  /// `تدريب Flutter ده مش كورس تعليمي تقليدي،\nده برنامج عملي معمول علشان يجهز المتدرب يشتغل فعليًا على مشاريع حقيقية داخل الشركة.\nخلال فترة التدريب، المتدرب هيكون جزء من فريق العمل، وهيتعامل مع كود حقيقي، متطلبات حقيقية، ومشاكل بتتحل يوميًا في مشاريع قائمة بالفعل\nمش مجرد تطبيقات تجريبية أو أمثلة للتعلم.\nالتدريب بيعتمد على إن المتدرب:\n• يفهم طريقة الشغل داخل الشركة\n• يلتزم بمعايير كتابة كود احترافي\n• يتعامل مع Git وإدارة الإصدارات\n• يشتغل ضمن فريق ويستقبل Feedback بشكل مستمر\nالهدف الأساسي من التدريب هو تحويل المتدرب من مستوى متعلم إلى مطور Flutter قادر يدخل أي مشروع ويشتغل عليه بثقة.`
  String get about_training_content {
    return Intl.message(
      'تدريب Flutter ده مش كورس تعليمي تقليدي،\nده برنامج عملي معمول علشان يجهز المتدرب يشتغل فعليًا على مشاريع حقيقية داخل الشركة.\nخلال فترة التدريب، المتدرب هيكون جزء من فريق العمل، وهيتعامل مع كود حقيقي، متطلبات حقيقية، ومشاكل بتتحل يوميًا في مشاريع قائمة بالفعل\nمش مجرد تطبيقات تجريبية أو أمثلة للتعلم.\nالتدريب بيعتمد على إن المتدرب:\n• يفهم طريقة الشغل داخل الشركة\n• يلتزم بمعايير كتابة كود احترافي\n• يتعامل مع Git وإدارة الإصدارات\n• يشتغل ضمن فريق ويستقبل Feedback بشكل مستمر\nالهدف الأساسي من التدريب هو تحويل المتدرب من مستوى متعلم إلى مطور Flutter قادر يدخل أي مشروع ويشتغل عليه بثقة.',
      name: 'about_training_content',
      desc: '',
      args: [],
    );
  }

  /// `طبيعة الشغل أثناء التدريب`
  String get work_nature_title {
    return Intl.message(
      'طبيعة الشغل أثناء التدريب',
      name: 'work_nature_title',
      desc: '',
      args: [],
    );
  }

  /// `المشاركة في تطوير تطبيقات موبايل حقيقية`
  String get work_nature_item_1 {
    return Intl.message(
      'المشاركة في تطوير تطبيقات موبايل حقيقية',
      name: 'work_nature_item_1',
      desc: '',
      args: [],
    );
  }

  /// `تنفيذ Features مطلوبة في مشاريع قائمة`
  String get work_nature_item_2 {
    return Intl.message(
      'تنفيذ Features مطلوبة في مشاريع قائمة',
      name: 'work_nature_item_2',
      desc: '',
      args: [],
    );
  }

  /// `التعامل مع APIs و Backends فعلية`
  String get work_nature_item_3 {
    return Intl.message(
      'التعامل مع APIs و Backends فعلية',
      name: 'work_nature_item_3',
      desc: '',
      args: [],
    );
  }

  /// `إصلاح Bugs وتحسين الأداء`
  String get work_nature_item_4 {
    return Intl.message(
      'إصلاح Bugs وتحسين الأداء',
      name: 'work_nature_item_4',
      desc: '',
      args: [],
    );
  }

  /// `الالتزام بـ Clean Code و Architecture واضحة`
  String get work_nature_item_5 {
    return Intl.message(
      'الالتزام بـ Clean Code و Architecture واضحة',
      name: 'work_nature_item_5',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الخروج`
  String get logout {
    return Intl.message(
      'تسجيل الخروج',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `تم تسجيل الخروج بنجاح`
  String get logout_success {
    return Intl.message(
      'تم تسجيل الخروج بنجاح',
      name: 'logout_success',
      desc: '',
      args: [],
    );
  }

  /// `لا توجد جلسة نشطة، يرجى تسجيل الدخول`
  String get no_session_error {
    return Intl.message(
      'لا توجد جلسة نشطة، يرجى تسجيل الدخول',
      name: 'no_session_error',
      desc: '',
      args: [],
    );
  }

  /// `فشل جلب بيانات الملف الشخصي`
  String get profile_fetch_error {
    return Intl.message(
      'فشل جلب بيانات الملف الشخصي',
      name: 'profile_fetch_error',
      desc: '',
      args: [],
    );
  }

  /// `فشل جلب البيانات أوفلاين`
  String get profile_fetch_offline_error {
    return Intl.message(
      'فشل جلب البيانات أوفلاين',
      name: 'profile_fetch_offline_error',
      desc: '',
      args: [],
    );
  }

  /// `فشل تعديل البيانات`
  String get profile_update_error {
    return Intl.message(
      'فشل تعديل البيانات',
      name: 'profile_update_error',
      desc: '',
      args: [],
    );
  }

  /// `تم تعديل البيانات بنجاح`
  String get profile_update_success {
    return Intl.message(
      'تم تعديل البيانات بنجاح',
      name: 'profile_update_success',
      desc: '',
      args: [],
    );
  }

  /// `معرض الصور`
  String get gallery_label {
    return Intl.message(
      'معرض الصور',
      name: 'gallery_label',
      desc: '',
      args: [],
    );
  }

  /// `الكاميرا`
  String get camera_label {
    return Intl.message(
      'الكاميرا',
      name: 'camera_label',
      desc: '',
      args: [],
    );
  }

  /// `حجم الصورة يتعدى 5 ميجابايت`
  String get image_size_error {
    return Intl.message(
      'حجم الصورة يتعدى 5 ميجابايت',
      name: 'image_size_error',
      desc: '',
      args: [],
    );
  }

  /// `أنت تعمل في وضع الأوفلاين`
  String get offline_mode_msg {
    return Intl.message(
      'أنت تعمل في وضع الأوفلاين',
      name: 'offline_mode_msg',
      desc: '',
      args: [],
    );
  }

  /// `يجب أن تحتوي كلمة المرور على حرف كبير، حرف صغير، رقم، ورمز خاص`
  String get password_complexity_error {
    return Intl.message(
      'يجب أن تحتوي كلمة المرور على حرف كبير، حرف صغير، رقم، ورمز خاص',
      name: 'password_complexity_error',
      desc: '',
      args: [],
    );
  }

  /// `على الأقل 6 أحرف`
  String get password_rule_length {
    return Intl.message(
      'على الأقل 6 أحرف',
      name: 'password_rule_length',
      desc: '',
      args: [],
    );
  }

  /// `حرف كبير واحد (A-Z)`
  String get password_rule_uppercase {
    return Intl.message(
      'حرف كبير واحد (A-Z)',
      name: 'password_rule_uppercase',
      desc: '',
      args: [],
    );
  }

  /// `حرف صغير واحد (a-z)`
  String get password_rule_lowercase {
    return Intl.message(
      'حرف صغير واحد (a-z)',
      name: 'password_rule_lowercase',
      desc: '',
      args: [],
    );
  }

  /// `رقم واحد (0-9)`
  String get password_rule_number {
    return Intl.message(
      'رقم واحد (0-9)',
      name: 'password_rule_number',
      desc: '',
      args: [],
    );
  }

  /// `رمز خاص واحد (مثال: @، #، $)`
  String get password_rule_special {
    return Intl.message(
      'رمز خاص واحد (مثال: @، #، \$)',
      name: 'password_rule_special',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
