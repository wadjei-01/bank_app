import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template_app/core/core_provider.dart';

class StorageManager {
  StorageManager(this.prefs) {
    staticPrefs = prefs;
  }
  final SharedPreferences prefs;

  static late final SharedPreferences staticPrefs;

  List<Map<String, dynamic>> getJsonList(String key) {
    return List<Map<String, dynamic>>.from(
      jsonDecode(prefs.getString(key) ?? '[]'),
    );
  }

  Map<String, dynamic> getJsonMap(String key) {
    return Map<String, dynamic>.from(jsonDecode(prefs.getString(key) ?? '{}'));
  }

  bool getBoolean(String key) {
    return prefs.getBool(key) ?? false;
  }

  void saveJson(String key, List<Map<String, dynamic>> json) {
    prefs.setString(key, jsonEncode(json));
  }

  void saveJsonMap(String key, Map<String, dynamic> json) {
    prefs.setString(key, jsonEncode(json));
  }

  void saveBoolean(String key, bool value) {
    prefs.setBool(key, value);
  }

  static final provider = Provider<StorageManager>(
    (ref) => StorageManager(ref.watch(sharedPreferencesProvider)),
  );
}
