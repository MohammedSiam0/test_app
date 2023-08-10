import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/utils/app_colors.dart';

ThemeData appTheme() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // make status bar transparent
      statusBarIconBrightness: Brightness.dark, // set icon color to black
    ),
  );
  return ThemeData(
    primaryColor: AppColors.blue,
    hintColor: Colors.grey,
    brightness: Brightness.light,
    fontFamily: "d",
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        color: Colors.transparent,
        elevation: 0,
        titleTextStyle:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
          fontSize: 22, height: 1.3, color: Colors.white, fontFamily: 'd'),
    ),
  );
}
