import 'package:flutter/material.dart';

import 'package:annoty/app/core/constants/color/core.dart';

class MyAppBarTheme extends AppBarTheme {
  // final Color? color,
  @override
  final Color? backgroundColor = MyCoreColor.windowDark;
  @override
  final Color? foregroundColor = MyCoreColor.accent;
  @override
  final double? elevation = 0;
  // final double? scrolledUnderElevation,
  // final Color? shadowColor,
  // final Color? surfaceTintColor,
  // final ShapeBorder? shape,
  // final IconThemeData? iconTheme,
  // final IconThemeData? actionsIconTheme,
  @override
  final bool? centerTitle = true;
  // final double? titleSpacing,
  // final double? toolbarHeight,
  // final TextStyle? toolbarTextStyle,
  // final TextStyle? titleTextStyle,
  // final SystemUiOverlayStyle? systemOverlayStyle
}
