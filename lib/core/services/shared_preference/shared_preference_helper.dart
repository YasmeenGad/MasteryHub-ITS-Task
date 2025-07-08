import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  factory SharedPrefHelper() {
    return preferences;
  }

  SharedPrefHelper._internal();

  static final SharedPrefHelper preferences = SharedPrefHelper._internal();

  static late SharedPreferences sharedPreferences;

  Future<dynamic> instantiatePreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  SharedPreferences getPreferenceInstance() {
    return sharedPreferences;
  }

  Future<dynamic> setString({
    required String key,
    required String stringValue,
  }) async {
    await sharedPreferences.setString(key, stringValue);
  }

  String? getString({required String key}) {
    return sharedPreferences.getString(key);
  }

  Future<dynamic> setBoolean({
    required String key,
    required bool boolValue,
  }) async {
    await sharedPreferences.setBool(key, boolValue);
  }

  bool? getBoolean({required String key}) {
    return sharedPreferences.getBool(key);
  }

  Future<dynamic> setDouble({
    required String key,
    required double doubleValue,
  }) async {
    await sharedPreferences.setDouble(key, doubleValue);
  }

  double? getDouble({required String key}) {
    return sharedPreferences.getDouble(key);
  }
  Future<dynamic> setInt({required String key, required int intValue}) async {
    await sharedPreferences.setInt(key, intValue);
  }
  int? getInt({required String key}) {
    return sharedPreferences.getInt(key);
  }
  Future<dynamic> removePreference({required String key}) async {
    await sharedPreferences.remove(key);
  }
  bool containPreference({required String key}) {
    if (sharedPreferences.get(key) == null) {
      return false;
    } else {
      return true;
    }
  }
  Future<dynamic> clearPreferences() async {
    await sharedPreferences.clear();
  }
}
