import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

mixin PreferenceHelper {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> writeIntoStorage(String key, Object value) async {
    await storage.write(
      key: key,
      value: value.toString(),
    );
  }

  Future<String> readFromStorage(String key) async {
    return await (storage.read(key: key)) ?? '';
  }

  Future<bool> hasPreference() async {
    final Map<String, String> allValues = await storage.readAll();
    return allValues.isNotEmpty;
  }

  Future<void> clearFromStorage() async {
    await storage.deleteAll();
  }
}
