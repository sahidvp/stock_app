import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
      primaryColor: Colors.black, scaffoldBackgroundColor: Colors.black);
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark, // Enables dark mode
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white, // Text color in AppBar
    ),
  );
}
