import 'package:fanpulse/app/constants/theme_constants.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static getApplicationTheme() {
    return ThemeData(
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Montserrat Bold',
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontFamily: 'Montserrat Bold'),
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
