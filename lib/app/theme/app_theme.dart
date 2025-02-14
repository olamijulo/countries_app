import 'package:countries_app/app/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: AppColors.orange,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black),
        ),
        textTheme: TextTheme(
          headlineLarge: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          headlineMedium: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          headlineSmall: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          labelLarge: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          labelMedium: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          labelSmall: TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
          bodyLarge: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          bodyMedium: TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
          bodySmall: TextStyle(fontSize: 14, color: Colors.black),
        ),
        colorScheme: ColorScheme.light(primary: Colors.black),
        fontFamily: 'Axiforma');
  }

  static ThemeData get darkTheme {
    return ThemeData(
        primaryColor: AppColors.orange,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.blue,
        bottomSheetTheme: BottomSheetThemeData(backgroundColor: AppColors.blue),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.blue,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white),
        ),
        textTheme: TextTheme(
          headlineLarge: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          headlineMedium: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          headlineSmall: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          labelLarge: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          labelMedium: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          labelSmall: TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
          bodyLarge: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          bodyMedium: TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
          bodySmall: TextStyle(fontSize: 14, color: Colors.white),
        ),
        colorScheme: ColorScheme.dark(primary: Colors.white),
        fontFamily: 'Axiforma');
  }
}
