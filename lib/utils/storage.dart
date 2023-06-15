import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String getString(String key, {String defaultValue = ''}) {
    return _prefs.getString(key) ?? defaultValue;
  }

  static int getInt(String key, {int defValue = 0}) {
    return _prefs.getInt(key) ?? defValue;
  }

  static Future<bool> setItemBool(String key, bool value) {
    return _prefs.setBool(key, value);
  }

  static Future<bool> setItemString(String key, String value) {
    return _prefs.setString(key, value);
  }

  static Future<bool> setItemInt(String key, int value) {
    return _prefs.setInt(key, value);
  }

  static Future<bool> setItemList(String key, List<String> value) {
    return _prefs.setStringList(key, value);
  }

  static Future<bool> removeItem(String key) {
    return _prefs.remove(key);
  }

  static Future<bool> clear() {
    return _prefs.clear();
  }
}

class LocalStorageTools {
  static const String _token = 'token';

  static getToken() {
    LocalStorage.getString(LocalStorageTools._token);
  }

  static Future<bool> setToken(String value) async {
    return await LocalStorage.setItemString(LocalStorageTools._token, value);
  }
}
