import 'package:annoty/app/core/constants/color/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTextTheme extends TextTheme {
  final String? fontFace;
  final Color? color;
  final FontWeight? fontWeight;
  @override
  TextStyle? get titleLarge =>
      MyTextStyle(fontSize: 34, fontFamily: fontFace??"Quicksand Bold", fontWeight: FontWeight.w700, color: color);
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

  const MyTextTheme({this.fontFace = "QuickSand", this.color, this.fontWeight});
}

class MyTextStyle extends TextStyle {
  @override
  final String? fontFamily;
  @override
  final FontWeight? fontWeight;
  @override
  final double fontSize;
  final Color? color;

  const MyTextStyle._({
    this.fontFamily = "Quicksand",
    this.fontWeight = FontWeight.w700,
    this.color,
    required this.fontSize,
  }) : super(
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          color: color,
          fontSize: fontSize,
        );

  factory MyTextStyle({
    required double fontSize,
    String? fontFamily,
    Color? color,
    FontWeight? fontWeight
  }) {
    final isLightTheme = Get.theme.brightness == Brightness.light;
    final bcolor = color ?? (isLightTheme ? MyCoreColor.muteBlack : MyCoreColor.activeGrey);

    return MyTextStyle._(color: bcolor, fontSize: fontSize, fontFamily: fontFamily,fontWeight: fontWeight);
  }
}