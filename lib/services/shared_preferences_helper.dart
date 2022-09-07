

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

  static setLocale(String locale)async{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  prefs.setString('Locale',locale);
  }

  static Future<String> getLocale() async{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  return prefs.getString('Locale')??'Default';
  }

}