import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mis_finanzas/controller/dashboard_provider.dart';
import 'package:mis_finanzas/controller/transaction_controller.dart';
import 'package:mis_finanzas/views/screens/home_screen.dart';
import 'package:mis_finanzas/views/screens/withdraw_screen.dart';
import 'package:provider/provider.dart';
import 'deposit_screen.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:(Provider.of<DashboardController>(context).dashIndex==0)?
      HomeScreen():
      Provider.of<DashboardController>(context).dashIndex==1?
          DepositScreen():
          WithdrawScreen()
      ,
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: Provider.of<DashboardController>(context).dashIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (int value) {
          Provider.of<DashboardController>(context, listen: false)
              .changeIndex(value);
          Provider.of<TransactionController>(context,listen: false).currentBalance=0;
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('HomeBottomNavigationBar'.tr),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.add),
            title: Text('DepositBottomNavigationBar'.tr),
            activeColor: Colors.green,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.remove),
            title: Text('WithdrawBottomNavigationBar'.tr),
            activeColor: Colors.redAccent,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
