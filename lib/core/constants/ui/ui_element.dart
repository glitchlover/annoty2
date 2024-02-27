import 'package:flutter/material.dart';

class ConstUiMisc{
  List<BoxShadow> shadow = const [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.14),
      blurRadius: 2,
    ),
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.12),
      blurRadius: 2,
      offset: Offset(0, 2),
    ),
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.2),
      blurRadius: 3,
      offset: Offset(0, 1),
    ),
  ];
}
