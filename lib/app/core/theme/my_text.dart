import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class MyText extends Text {
  final String text;
  final Color color;

  static const Color _defaultColor = Colors.black;

  const MyText(this.text, {super.key, this.color = _defaultColor}) : super(text);

  Text temp(TextStyle? textstyle) {
    return Text(text, style: textstyle);
  }

  Text heading1() {
    return Text(text, style: Get.textTheme.headlineLarge);
  }

  Text heading2() {
    return Text(text, style: Get.textTheme.headlineMedium);
  }

  Text heading3() {
    return Text(
      text,
      style: Get.textTheme.headlineSmall,
    );
  }

  Text paragraph() {
    return Text(
      text,
      style: Get.textTheme.bodyMedium,
    );
  }

  Text captions() {
    return Text(
      text,
      style: Get.textTheme.labelSmall,
    );
  }
}
