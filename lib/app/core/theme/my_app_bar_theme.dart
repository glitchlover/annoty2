import 'package:flutter/material.dart';

import 'package:annoty/app/core/constants/color/core.dart';

class MyAppBarTheme extends AppBarTheme {
  // final Color? color,
  @override
  Color? get backgroundColor => ConstColorMain.windowDark;
  @override
  Color? get foregroundColor => ConstColorMain.accent;
  @override
  double? get elevation => 0;
  // final double? scrolledUnderElevation,
  // final Color? shadowColor,
  // final Color? surfaceTintColor,
  // final ShapeBorder? shape,
  // final IconThemeData? iconTheme,
  // final IconThemeData? actionsIconTheme,
  @override
  bool? get centerTitle => true;
  // final double? titleSpacing,
  // final double? toolbarHeight,
  // final TextStyle? toolbarTextStyle,
  // final TextStyle? titleTextStyle,
  // final SystemUiOverlayStyle? systemOverlayStyle
}
