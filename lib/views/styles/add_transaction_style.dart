import 'package:flutter/material.dart';
import 'package:mis_finanzas/core/utils/app_colors.dart';

InputDecoration? dialogFormField({
  required String labelText,

}) =>
    InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(color: AppColors.textColor1),
      enabledBorder:OutlineInputBorder(
        borderRadius:BorderRadius.circular(10),
        borderSide: BorderSide(
            color: AppColors.textColor1
        ),

      ),
      focusedErrorBorder:OutlineInputBorder(
        borderRadius:BorderRadius.circular(10),
        borderSide: BorderSide(
            color: Colors.red
        ),

      ),
      focusedBorder:OutlineInputBorder(
        borderRadius:BorderRadius.circular(10),
        borderSide: BorderSide(
            color: Colors.blueGrey
        ),

      ),
      errorBorder:OutlineInputBorder(
        borderRadius:BorderRadius.circular(10),
        borderSide: BorderSide(
            color: Colors.red
        ),
      ),
      disabledBorder:OutlineInputBorder(
        borderRadius:BorderRadius.circular(10),
        borderSide: BorderSide(
            color: Colors.blueGrey
        ),
      ),
    );