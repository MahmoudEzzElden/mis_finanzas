import 'package:flutter/material.dart';

InputDecoration? dialogFormField({
  required String labelText,

}) =>
    InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.white),
      enabledBorder:OutlineInputBorder(
        borderRadius:BorderRadius.circular(10),
        borderSide: BorderSide(
            color: Colors.white
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