import 'package:shared_preferences/shared_preferences.dart';

class Cachehelper {
  static late SharedPreferences sharedPreferences;
  static inti() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> savedate(
      {required String key, required dynamic value}) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    if (value is double) return await sharedPreferences.setDouble(key, value);
    return await sharedPreferences.setStringList(key, value);
  }

  static dynamic getdata({required String key}) {
    return sharedPreferences.get(key);
  }

  static Future<bool> removedata({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  static bool containkey({required String key}) {
    return sharedPreferences.containsKey(key);
  }

  static cleardata() async {
    return await sharedPreferences.clear();
  }
}
