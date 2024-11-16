import 'package:flutter/material.dart';
import 'package:travellapp/core/configs/theme/colors.dart';

class AppTheme {
  static final Theme = ThemeData(
      brightness: Brightness.light,
      primaryColor: ColorApp.primary,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: ColorApp.primary,
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)))));
}
