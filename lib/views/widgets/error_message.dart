import 'package:flutter/material.dart';
import 'package:mis_finanzas/core/utils/assets_manager.dart';
import 'package:sizer/sizer.dart';

class ErrorScreen extends StatelessWidget {
  final String? errorText;

  const ErrorScreen({Key? key, this.errorText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(AssetManager.errorScreenImg),
            Text(
              errorText!,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
