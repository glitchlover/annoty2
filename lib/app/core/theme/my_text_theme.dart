import 'package:flutter/material.dart';
class MyTextTheme extends TextTheme {
  final String? fontFace;
  @override
  TextStyle? get titleLarge => MyTextStyle(fontSize: 34);
  @override
  TextStyle? get headlineLarge => MyTextStyle(fontSize: 24);
  @override
  TextStyle? get headlineMedium => MyTextStyle(fontSize: 18);
  @override
  TextStyle? get headlineSmall => MyTextStyle(fontSize: 14);
  @override
  TextStyle? get bodyMedium => MyTextStyle(fontSize: 12);
  @override
  TextStyle? get labelSmall => MyTextStyle(fontSize: 10);

  const MyTextTheme({this.fontFace = "QuickSand"});
}

class MyTextStyle extends TextStyle {
  @override
  final String fontFamily;
  @override
  final double fontSize;

  MyTextStyle({this.fontFamily = "Quicksand", required this.fontSize});
}
