import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {

  static late SharedPreferences _prefs;
    static initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }


  static Future<void> login() async {
    _prefs.setBool('login', true);
  }
  static Future<void> setUserName(String name) async {
    _prefs.setString('userName', name);
  }
    static Future<void> setUserEmail(String email) async {
    _prefs.setString('userEmail', email);
  }
 static Future<void> clearCache() async {
    _prefs.clear();
  }

  static bool get getIsLogined => _prefs.getBool('login') ?? false;
  static String get getUserName => _prefs.getString('userName') ?? "";
  static String get getUserEmail => _prefs.getString('userEmail') ?? "";
 
}
