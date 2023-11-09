import 'package:annoty/app/core/constants/color/core.dart';
import 'package:annoty/app/core/constants/color/text.dart';
import 'package:annoty/app/core/constants/misc/is_it.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTextTheme extends TextTheme {
  final String? fontFace;
  final Color? color;
  final FontWeight? fontWeight;

  @override
  TextStyle? get titleLarge => MyTextStyle(
      fontSize: 34,
      fontFamily: fontFace ?? "Quicksand Bold",
      fontWeight: FontWeight.w700,
      color: color);
  @override
  TextStyle? get headlineLarge => MyTextStyle(fontSize: 24);
  @override
  TextStyle? get headlineMedium => MyTextStyle(fontSize: 20);
  @override
  TextStyle? get headlineSmall => MyTextStyle(fontSize: 18);
  @override
  TextStyle? get bodyMedium => MyTextStyle(fontSize: 16, color: ConstColorMain.accentWhite);
  @override
  TextStyle? get labelSmall => MyTextStyle(fontSize: 10);

  const MyTextTheme._(
      {this.fontFace = "QuickSand", this.color, this.fontWeight});
  factory MyTextTheme(
      {String? fontFace, Color? color, FontWeight? fontWeight}) {
    Color bcolor = color ??
        (IsIt.dark
            ? ConstColorTextDark.primaryDark
            : ConstColorTextLight.primaryLight);
    return MyTextTheme._(
        fontFace: fontFace, color: bcolor, fontWeight: fontWeight);
  }
}

class MyTextStyle extends TextStyle {
  @override
  String? get fontFamily => fontFamilySet;
  final String? fontFamilySet;
  @override
  FontWeight? get fontWeight => fontWeightSet;
  final FontWeight? fontWeightSet;
  @override
  double get fontSize => fontSizeSet;
  final double fontSizeSet;
  @override
  Color? get color => colorSet;
  final Color? colorSet;

  const MyTextStyle._({
    this.fontFamilySet = "Quicksand",
    this.fontWeightSet = FontWeight.w700,
    this.colorSet,
    required this.fontSizeSet,
  }) : super(
          fontFamily: fontFamilySet,
          fontWeight: fontWeightSet,
          color: colorSet,
          fontSize: fontSizeSet,
        );

  factory MyTextStyle(
      {required double fontSize,
      String? fontFamily,
      Color? color,
      FontWeight? fontWeight}) {
    final isLightTheme = Get.theme.brightness == Brightness.light;
    final bcolor = color ??
        (isLightTheme ? ConstColorMain.muteBlack : ConstColorMain.muteGrey);

    return MyTextStyle._(
        colorSet: bcolor,
        fontSizeSet: fontSize,
        fontFamilySet: fontFamily,
        fontWeightSet: fontWeight);
  }
}
