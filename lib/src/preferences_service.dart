
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  static Future<bool> setBool(String key, bool value) {
    return _prefs.setBool(key, value);
  }

  static int? getInt(String key) {
    return _prefs.getInt(key);
  }

  static Future<bool> setInt(String key, int value) {
    return _prefs.setInt(key, value);
  }

  static String? getString(String key) {
    return _prefs.getString(key);
  }

  static Future<bool> setString(String key, String value) {
    return _prefs.setString(key, value);
  }

  static List<String>? getStringList(String key) {
    return _prefs.getStringList(key);
  }

  static Future<bool> setStringList(String key, List<String> value) {
    return _prefs.setStringList(key, value);
  }

  static Future<bool> remove(String key) {
    return _prefs.remove(key);
  }
}