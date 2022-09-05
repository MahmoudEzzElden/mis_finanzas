import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mis_finanzas/controller/dashboard_provider.dart';
import 'package:mis_finanzas/controller/month_dropdown.dart';
import 'package:mis_finanzas/controller/transaction_controller.dart';
import 'package:mis_finanzas/views/screens/dashboard.dart';
import 'package:provider/provider.dart';
import 'localization/app_translation.dart';


void   main()  {

  runApp(MultiProvider
    (
    providers: [
      ChangeNotifierProvider<DashboardController>(
          create: (context) => DashboardController()),
      ChangeNotifierProvider<TransactionController>(
          create: (context) => TransactionController()),
      ChangeNotifierProvider<MonthDropDown>(
          create: (context) => MonthDropDown()),
    ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: AppTranslations(),
      locale: Get.deviceLocale,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logoWidth: 100,
  logo: Image.asset('assets/images/splashimage.png'),
    loaderColor: Color(0xff195176),
      navigator: Dashboard(),
    );
  }
}

