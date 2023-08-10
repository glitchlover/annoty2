import 'package:annoty/app/core/constants/color/core.dart';
import 'package:annoty/app/core/helper/color_utils.dart';
import 'package:flutter/material.dart';

class MyFloationActionButtonTheme extends FloatingActionButtonThemeData{
  @override
  final Color? foregroundColor = ColorUtils.lighten(MyCoreColor.accent, 1);
  final Color? backgroundColor = ColorUtils.darken(MyCoreColor.accent, .3);
  // final Color? focusColor;
  final Color? hoverColor = MyCoreColor.accent;
  // final Color? splashColor;
  @override
  final double? elevation = 0;
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