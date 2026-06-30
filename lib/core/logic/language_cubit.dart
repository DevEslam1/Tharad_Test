import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../caching/cache_service.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(Locale(CacheService.getLanguage()));

  void changeLanguage(String languageCode) {
    CacheService.saveLanguage(languageCode);
    emit(Locale(languageCode));
  }
}
