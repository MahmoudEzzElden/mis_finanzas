import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mis_finanzas/controller/dashboard_provider.dart';
import 'package:mis_finanzas/controller/month_dropdown.dart';
import 'package:mis_finanzas/controller/transaction_controller.dart';
import 'package:mis_finanzas/core/utils/assets_manager.dart';
import 'package:mis_finanzas/services/shared_preferences_helper.dart';
import 'package:mis_finanzas/views/screens/dashboard.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'localization/app_translation.dart';
import 'package:responsive_framework/responsive_framework.dart';



late final locale;
late final theme;
Future<void>   main()  async {
  WidgetsFlutterBinding.ensureInitialized();
   locale=await SharedPreHelper.getLocale();
    theme=await SharedPreHelper.getDarkTheme();
  runApp(MultiProvider
    (
    providers: [
      ChangeNotifierProvider<DashboardController>(
          create: (context) => DashboardController(theme: theme)),
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
      builder:(context, widget) {
        return ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget!),
          breakpoints: const [
            ResponsiveBreakpoint.resize(350, name: MOBILE),
            ResponsiveBreakpoint.autoScale(600, name: TABLET),
            ResponsiveBreakpoint.resize(800, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
          ],
        );},
      translations: AppTranslations(),
      locale: locale=='Default'? Get.deviceLocale:Locale(locale),
      debugShowCheckedModeBanner: false,
      theme: Provider.of<DashboardController>(context).theme==false? ThemeData.light():ThemeData.dark(),
      home: const SplashScreen(),
    );

  }
}
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logoWidth:100,
  logo: Image.asset(AssetManager.splashScreenImg),
    loaderColor: Color(0xff195176),
      navigator: Dashboard(),
    );
  }
}

