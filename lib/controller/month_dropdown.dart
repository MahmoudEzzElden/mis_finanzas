import 'package:flutter/material.dart';

class MonthDropDown with ChangeNotifier{

List<String> months=[ "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
    ];

String? monthOnDropDown;
int dropDownMonth=DateTime.now().month;

  ///this function used to change month in deposit screen
  changeMonth(String month){
    monthOnDropDown=month;
    dropDownMonth=months.indexOf(monthOnDropDown!)+1;
    notifyListeners();
  }

}