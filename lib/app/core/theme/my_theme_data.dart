import 'package:annoty/app/core/constants/color/core.dart';
import 'package:flutter/material.dart';

mixin MyThemeData {
  static var floatingActionButtonThemeData = const FloatingActionButtonThemeData(
      backgroundColor: MyCoreColor.accent,
      foregroundColor: MyCoreColor.activeBlack,
      elevation: 30);
  static var appBarTheme = const AppBarTheme(
    color: MyCoreColor.windowDark,
    foregroundColor: MyCoreColor.accentWhite,
    elevation: 0,
  );

  static ThemeData get lightthemeData {
    return ThemeData(
      textTheme: buildTheme(Colors.black),
      primaryColor: MyCoreColor.accent,
      cardColor: Colors.white,
      floatingActionButtonTheme: floatingActionButtonThemeData,
      appBarTheme: appBarTheme,
      shadowColor: const Color.fromARGB(161, 96, 125, 139),
      brightness: Brightness.light,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }

  static ThemeData get darkthemeData => ThemeData(
        textTheme: buildTheme(Colors.white),
        primaryColor: MyCoreColor.accent,
        cardColor: MyCoreColor.muteBlack,
        floatingActionButtonTheme: floatingActionButtonThemeData,
        appBarTheme: appBarTheme,
        scaffoldBackgroundColor: MyCoreColor.backgroundDark,
        shadowColor: const Color.fromARGB(255, 0, 0, 0),
        brightness: Brightness.dark,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      );

  static TextTheme buildTheme(Color color) {
    return TextTheme(
      titleLarge: TextStyle(fontSize: 34, color: color),
      headlineLarge: TextStyle(fontSize: 24, color: color),
      headlineMedium: TextStyle(fontSize: 18, color: color),
      headlineSmall: TextStyle(fontSize: 14, color: color),
      bodyMedium: TextStyle(fontSize: 12, color: color),
      labelSmall: TextStyle(fontSize: 10, color: color),
    );
  }
}
