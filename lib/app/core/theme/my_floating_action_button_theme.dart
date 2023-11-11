import 'package:annoty/app/core/constants/color/core.dart';
import 'package:annoty/app/core/utils/color_utils.dart';
import 'package:flutter/material.dart';

class MyFloationActionButtonTheme extends FloatingActionButtonThemeData{
  @override
  Color? get foregroundColor =>
      ColorUtils.lighten(ConstColorMain.accent, 1);
  @override
  Color? get backgroundColor =>
      ColorUtils.darken(ConstColorMain.accent, .3);
  // final Color? focusColor;
  @override
  Color? get hoverColor => ConstColorMain.accent;
  // final Color? splashColor;
  @override
  double? get elevation => 0;
  // final double? focusElevation;
  // final double? hoverElevation;
  // final double? disabledElevation;
  // final double? highlightElevation;
  // final ShapeBorder? shape;
  // final bool? enableFeedback;
  // final double? iconSize;
  // final BoxConstraints? sizeConstraints;
  // final BoxConstraints? smallSizeConstraints;
  // final BoxConstraints? largeSizeConstraints;
  // final BoxConstraints? extendedSizeConstraints;
  // final double? extendedIconLabelSpacing;
  // final EdgeInsetsGeometry? extendedPadding;
  // final TextStyle? extendedTextStyle;
  // final MaterialStateProperty<MouseCursor?>? mouseCursor;
}