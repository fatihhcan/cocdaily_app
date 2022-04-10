import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {

  static late SharedPreferences _prefs;
    static initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }


  static Future<void> login() async {
    _prefs.setBool('login', true);
  }

  static bool get getIsLogined => _prefs.getBool('login') ?? false;
}
