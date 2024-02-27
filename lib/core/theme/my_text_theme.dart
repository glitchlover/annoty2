import 'package:annoty/core/constants/color/text.dart';
import 'package:annoty/core/constants/misc/is_it.dart';
import 'package:flutter/material.dart';

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
  TextStyle? get headlineLarge => MyTextStyle(
      fontSize: 24,
      fontFamily: fontFace ?? "Quicksand Bold",
      fontWeight: FontWeight.w700,
      color: color
    );
  @override
  TextStyle? get headlineMedium => MyTextStyle(
      fontSize: 20,
      fontFamily: fontFace ?? "Quicksand Bold",
      fontWeight: FontWeight.w700,
      color: color);
  @override
  TextStyle? get headlineSmall => MyTextStyle(
    fontSize: 18,
    fontFamily: fontFace ?? "Quicksand Bold",
    fontWeight: FontWeight.w700,
    color: color);
  @override
  TextStyle? get bodyMedium =>
      MyTextStyle(
        fontSize: 16,
        fontFamily: fontFace ?? "Quicksand",
        fontWeight: FontWeight.normal,
        color: color);
  @override
  TextStyle? get bodySmall => MyTextStyle(
      fontSize: 12,
      fontFamily: fontFace ?? "Quicksand",
      fontWeight: FontWeight.normal,
      color: color);

  @override
  TextStyle? get labelSmall => MyTextStyle(
      fontSize: 12,
      fontFamily: fontFace ?? "Quicksand",
      fontWeight: FontWeight.normal,
      color: color);
  const MyTextTheme._(
      {this.fontFace = "QuickSand", this.color, this.fontWeight});
  factory MyTextTheme(
      {String? fontFace, Color? color, FontWeight? fontWeight}) {
    Color bcolor = color ??
        (IsIt.dark
            ? ConstColorText.primaryDark
            : ConstColorText.primaryLight);
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
    final bcolor = color ??
        (IsIt.dark
            ? ConstColorText.primaryDark
            : ConstColorText.primaryLight);

    return MyTextStyle._(
        colorSet: bcolor,
        fontSizeSet: fontSize,
        fontFamilySet: fontFamily,
        fontWeightSet: fontWeight);
  }
}
