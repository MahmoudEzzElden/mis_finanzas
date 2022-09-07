import 'package:flutter/material.dart';

import '../services/shared_preferences_helper.dart';


class DashboardController with ChangeNotifier {

  int dashIndex = 0;
  bool? theme;
  DashboardController({this.theme});

  changeIndex(int index) {
    dashIndex = index;
    notifyListeners();
  }

  changeTheme(bool isDark){
    theme=isDark;
    SharedPreHelper.setDarkTheme(isDark);
    notifyListeners();
  }



}

