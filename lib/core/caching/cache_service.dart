import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CacheService {
  static const String authBoxName = 'secure_auth_box';
  static const String tokenKey = 'token';
  static const String usernameKey = 'username';
  static const String emailKey = 'email';
  static const String imageKey = 'image';

  static Box? _box;

  static Future<void> init() async {
    await Hive.initFlutter();

    const secureStorage = FlutterSecureStorage();

    // Read the encryption key if it already exists
    final secureKey = await secureStorage.read(key: 'hive_encryption_key');
    List<int> encryptionKey;

    if (secureKey == null) {
      // Generate a new 256-bit encryption key
      encryptionKey = Hive.generateSecureKey();
      // Store the key securely encoded in base64
      await secureStorage.write(
        key: 'hive_encryption_key',
        value: base64UrlEncode(encryptionKey),
      );
    } else {
      // Decode the key from base64
      encryptionKey = base64Url.decode(secureKey);
    }

    // Open the encrypted box
    _box = await Hive.openBox(
      authBoxName,
      encryptionCipher: HiveAesCipher(encryptionKey),
    );
  }

  static Box _getBox() {
    if (_box == null) {
      throw StateError('CacheService must be initialized before use.');
    }
    return _box!;
  }

  static Future<void> saveToken(String token) async {
    await _getBox().put(tokenKey, token);
  }

  static String? getToken() {
    return _getBox().get(tokenKey);
  }

  static Future<void> saveProfile({
    required String username,
    required String email,
    String? imageUrl,
  }) async {
    final box = _getBox();
    await box.put(usernameKey, username);
    await box.put(emailKey, email);
    if (imageUrl != null) {
      await box.put(imageKey, imageUrl);
    }
  }

  static String? getUsername() {
    return _getBox().get(usernameKey);
  }

  static String? getEmail() {
    return _getBox().get(emailKey);
  }

  static String? getImageUrl() {
    return _getBox().get(imageKey);
  }

  static Future<void> clearSession() async {
    await _getBox().clear();
  }
}
