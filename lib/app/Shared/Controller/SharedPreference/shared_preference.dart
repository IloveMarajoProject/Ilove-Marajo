import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceController {

  Future loginAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('validar', true);
  }

  Future loginClose() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('validar', false);
  }
}