import 'package:flutter/material.dart';


class DashboardController with ChangeNotifier {

  int dashIndex = 0;


  changeIndex(int index) {
    dashIndex = index;
    notifyListeners();
  }


}

