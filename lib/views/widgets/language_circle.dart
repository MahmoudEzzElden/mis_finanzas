


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../services/shared_preferences_helper.dart';

class LanguageCircle extends StatelessWidget {
  final ImageProvider? image;

  const LanguageCircle({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        String locale = image.toString().split('/')[2]
            .split('.')
            .first;
            Get.updateLocale(Locale(locale));
        SharedPreHelper.setLocale(locale);
        Navigator.pop(context);
      },
      child:  Container(
        width: 60,
        height: 60,
        decoration:  BoxDecoration(
          image: DecorationImage(image: image!),
            shape: BoxShape.circle,
            color: Colors.brown,
            border:  Border.all(
              width: 2.0,
              color: Colors.white,
            ),
            boxShadow: [
               BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 5.0,
              ),
            ]
        ),
      )

    );
  }
}
