import 'package:annoty/core/constants/color/core.dart';
import 'package:flutter/material.dart';

class MyBoxDecoration {
  BoxDecoration uncontrasted({double radius = 10}) {
    return BoxDecoration(
        border: Border.all(color: Colors.transparent),
        color: ConstColorMain.black,
        borderRadius: BorderRadius.circular(radius));
  }
}
