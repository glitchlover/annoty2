import 'package:flutter/material.dart';

class MyTextTheme extends TextTheme {
  final String? fontFace;
  @override
  TextStyle? get titleLarge => const MyTextStyle(fontSize: 34, fontFamily: "Quicksand Bold");
  @override
  TextStyle? get headlineLarge => const MyTextStyle(fontSize: 24);
  @override
  TextStyle? get headlineMedium => const MyTextStyle(fontSize: 18);
  @override
  TextStyle? get headlineSmall => const MyTextStyle(fontSize: 14);
  @override
  TextStyle? get bodyMedium => const MyTextStyle(fontSize: 12);
  @override
  TextStyle? get labelSmall => const MyTextStyle(fontSize: 10);

  const MyTextTheme({this.fontFace = "QuickSand"});
}

class MyTextStyle extends TextStyle {
  @override
  final String fontFamily;
  @override
  final FontWeight fontWeight;
  @override
  final double fontSize;

  const MyTextStyle({this.fontFamily = "Quicksand", this.fontWeight = FontWeight.w700, required this.fontSize});
}
