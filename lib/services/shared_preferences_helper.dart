

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreHelper{


static  setDarkTheme(bool value)async
  {
    SharedPreferences prefs= await SharedPreferences.getInstance();
    prefs.setBool('Theme', value);
  }
  static Future<bool> getDarkTheme() async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    return  prefs.getBool('Theme')??false;
  }
}