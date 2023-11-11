import 'package:annoty/app/core/constants/color/core.dart';
import 'package:annoty/app/core/theme/my_app_bar_theme.dart';
import 'package:annoty/app/core/theme/my_floating_action_button_theme.dart';
import 'package:annoty/app/core/theme/my_icon_theme.dart';
import 'package:annoty/app/core/theme/my_text_theme.dart';
import 'package:annoty/app/core/utils/color_transformers.dart';
import 'package:flutter/material.dart';

mixin MyThemeData implements ThemeData {
  @override
  final Color primaryColor = ConstColorMain.accent;
  @override
  final Color splashColor = Colors.transparent;
  @override
  final Color highlightColor = Colors.transparent;
  @override
  final Color hoverColor = Colors.transparent;

  static ThemeData get lightthemeData => ThemeData(
        brightness: Brightness.light,
        cardColor: Colors.white,
        shadowColor: const Color.fromARGB(161, 96, 125, 139),
        textTheme: MyTextTheme(),
        appBarTheme: MyAppBarTheme(),
        floatingActionButtonTheme: MyFloationActionButtonTheme(),
        iconTheme: MyIconTheme(),
      );

  static ThemeData get darkthemeData => ThemeData(
        brightness: Brightness.dark,
        cardColor: ConstColorMain.muteBlack,
        scaffoldBackgroundColor: ConstColorMain.primaryBGDark,
        shadowColor:
            ColorTransformers.darken(ConstColorMain.primaryBGDark, 0.5),
        textTheme: MyTextTheme(),
        appBarTheme: MyAppBarTheme(),
        floatingActionButtonTheme: MyFloationActionButtonTheme(),
        iconTheme: MyIconTheme(),
      );
}