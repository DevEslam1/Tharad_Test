import 'package:tharad_app/tharad_tech.dart';
import 'package:flutter/material.dart';
import 'core/caching/cache_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheService.init();
  runApp(const TharadTech());
}
