import 'package:countries_app/app/app_colors.dart';
import 'package:countries_app/widgets/language_selection.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  static Future<void> setBoolean(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  static Future<bool> getBoolean(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  static void showCustomModalBottomSheet(context, {Widget? child = const SizedBox.shrink()}) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return child!;
        });
  }
}

