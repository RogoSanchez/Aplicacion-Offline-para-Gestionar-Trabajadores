import 'package:flutter/material.dart';

class Themes {
  static const String light = 'light';
  static const String dark = 'dark';

  static const List<String> values = [light, dark];

  static ThemeData getTheme(String theme) {
    switch (theme) {
      case light:
        return ThemeData.light();
      case dark:
        return ThemeData.dark();
      default:
        return ThemeData.light();
    }
  }

  
}