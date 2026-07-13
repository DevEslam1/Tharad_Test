import 'package:tharad_app/features/auth/ui/login_screen.dart';
import 'package:tharad_app/features/profile/ui/profile_screen.dart';
import 'package:tharad_app/core/caching/cache_service.dart';
import 'package:tharad_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/logic/language_cubit.dart';
import 'core/routing/app_router.dart';
import 'core/theming/colors.dart';
import 'core/theming/font_family_helper.dart';

class TharadTech extends StatelessWidget {
  const TharadTech({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageCubit(),
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocBuilder<LanguageCubit, Locale>(
            builder: (context, locale) {
              return MaterialApp(
                locale: locale,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                debugShowCheckedModeBanner: false,
                title: 'Tharad App',
                theme: ThemeData(
                  fontFamily: FontFamilyHelper.tajawal,
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: AppColors.mainColorDark,
                  ),
                  useMaterial3: true,
                ),
                onGenerateRoute: AppRouter.generateRoute,
                home: child,
              );
            },
          );
        },
        child: CacheService.getToken() != null && CacheService.isRememberMe()
            ? const ProfileScreen()
            : const LoginScreen(),
      ),
    );
  }
}
