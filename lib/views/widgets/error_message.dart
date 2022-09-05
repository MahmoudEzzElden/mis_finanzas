import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String? errorText;

  const ErrorScreen({Key? key, this.errorText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/errorScreen.png'),
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
