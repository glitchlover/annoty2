import 'package:annoty/core/constants/color/core.dart';
import 'package:flutter/material.dart';

mixin ConstColorText {
  static const primaryLight = ConstColorMain.black;
  static const secondaryLight = ConstColorMain.activeBlack;
  static const helperLight = Color(0xFF007ACC);
  static const errorLight = Color(0xFFB00020);

  static const primaryDark = ConstColorMain.white;
  static const secondryDark = ConstColorMain.activeGrey;
  static const helperyDark = Color.fromARGB(255, 47, 170, 252);
  static const errorDark = Color(0xFFEF5350);
}
