import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences? prefs;

  static Future configurePrefs() async =>
      prefs = await SharedPreferences.getInstance();
 
  //String
  static Future<void> setString(PreferencesListString name, List<String> data) async => await prefs!.setStringList(name.value, data);
  static List<String> getStringList(PreferencesListString name) =>
      prefs!.getStringList(name.value) ?? [];



  static remove(String name) => prefs!.remove(name);

  static removeAll() => prefs!.clear();
}



enum PreferencesListString {
  users('users');

  final String value;
  const PreferencesListString(this.value);
}

