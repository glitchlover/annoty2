import 'package:annoty/app/core/constants/color/core.dart';
import 'package:annoty/app/core/theme/my_app_bar_theme.dart';
import 'package:annoty/app/core/theme/my_floating_action_button_theme.dart';
import 'package:flutter/material.dart';

mixin MyThemeData{
  
  static ThemeData get lightthemeData {
    return ThemeData(
      textTheme: buildTheme(Colors.black),
      primaryColor: MyCoreColor.accent,
      cardColor: Colors.white,
      floatingActionButtonTheme: MyFloationActionButtonTheme(),
      appBarTheme: MyAppBarTheme(),
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
        floatingActionButtonTheme: MyFloationActionButtonTheme(),
        appBarTheme: MyAppBarTheme(),
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
