import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mis_finanzas/controller/dashboard_provider.dart';
import 'package:mis_finanzas/core/utils/app_colors.dart';
import 'package:mis_finanzas/core/utils/assets_manager.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'language_circle.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(AssetManager.appLogo)),
              ),
            ),
            Divider(
              height: 50,
              thickness:3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LanguageCircle(
                  image: AssetImage(AssetManager.arabicImg),
                ),
                LanguageCircle(
                  image: AssetImage(AssetManager.englishImg),
                ),
                LanguageCircle(
                  image: AssetImage(AssetManager.spanishImg),
                )
              ],
            ),
            Divider(
              height: 50,
              thickness:3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dark Mode',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary),
                ),
                Consumer<DashboardController>(
                  builder: (context, provider, child) {
                    return ToggleSwitch(
                      minWidth: 50,
                      cornerRadius: 20.0,
                      activeBgColors: [
                        [Colors.grey[800]!],
                        [Colors.blue[800]!]
                      ],
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.grey,
                      inactiveFgColor: Colors.white,
                      initialLabelIndex: provider.theme == false ? 0 : 1,
                      totalSwitches: 2,
                      labels: ['Off', 'On'],
                      radiusStyle: true,
                      onToggle: (index) {
                        index == 0
                            ? provider.changeTheme(false)
                            : provider.changeTheme(true);
                      },
                    );
                  },
                ),
              ],
            ),
            Divider(
              height: 50,
              thickness: 3,
            ),
            TextButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              child: Row(
                children: [
                  Text(
                    'LogOut',
                    style: TextStyle(fontSize:18, color: AppColors.primary),
                  ),
                  Icon(Icons.logout),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
