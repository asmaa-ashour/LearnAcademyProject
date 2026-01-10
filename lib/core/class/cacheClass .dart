import 'package:shared_preferences/shared_preferences.dart';

class CacheClass {
  static late SharedPreferences _prefs;

  static Future<void> cacheIniti() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    }
  }

  static String? getData({required String key}) {
    return _prefs.getString(key);
  }

  static Future<void> clear() async {
    await _prefs.clear();
  }
}
