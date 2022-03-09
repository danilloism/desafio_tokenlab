import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  static late SharedPreferences _prefs;

  static Future<bool> get isDataCached async {
    _prefs = await SharedPreferences.getInstance();
    bool cached = _prefs.getBool('cached') ?? false;
    return cached;
  }

  static Future<void> cacheData(String data) async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.setString('data', data);
    _prefs.setBool('cached', true);
  }

  static Future<String> get cache async {
    _prefs = await SharedPreferences.getInstance();
    final data = _prefs.getString('data') ?? 'No cached data.';
    return data;
  }

  static Future<void> get eraseCache async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.remove('data');
    _prefs.setBool('cached', false);
  }
}
