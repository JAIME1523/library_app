import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences? prefs;

  static Future configurePrefs() async =>
      prefs = await SharedPreferences.getInstance();
  //int
  static Future<void> setInt(PreferencesInt name, int data) async =>
      await prefs!.setInt(name.value, data);
  static int? getInt(PreferencesInt name) => prefs!.getInt(name.value);

  //String
  static Future<void> setString(PreferencesString name, String data) async =>
      await prefs!.setString(name.value, data);
  static String getString(PreferencesString name) =>
      prefs!.getString(name.value) ?? '';

  //bool
  static Future<void> setBool(PreferencesBool name, bool data) async =>
      await prefs!.setBool(name.value, data);
  static bool getBool(PreferencesBool name) =>
      prefs!.getBool(name.value) ?? false;

  static remove(String name) => prefs!.remove(name);

  static removeAll(String name) => prefs!.clear();
}

enum PreferencesInt {
  age('age');

  final String value;
  const PreferencesInt(this.value);
}

enum PreferencesString {
  name('name'),
  lastName('lastName'),
  email('email'),
  birthdate("birthdate"),
  gender('gender');

  final String value;
  const PreferencesString(this.value);
}

enum PreferencesBool {
  isBool('isBool');

  final String value;
  const PreferencesBool(this.value);
}
