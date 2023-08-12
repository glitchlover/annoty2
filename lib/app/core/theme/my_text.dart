import 'package:annoty/app/core/theme/my_text_theme.dart';
import 'package:flutter/material.dart';

class MyText extends Text {
  final String text;

  const MyText(this.text, {super.key}) : super(text);

  Text temp(TextStyle? textstyle) {
    return Text(text, style: textstyle);
  }

  Text title({
    String? fontFamily,
    Color? color,
    FontWeight? fontWeight
  }) {
    return Text(text, style: const MyTextTheme().titleLarge);
  }

  Text heading1() {
    return Text(text, style: const MyTextTheme().headlineLarge);
  }

  Text heading2() {
    return Text(text, style: const MyTextTheme().headlineMedium);
  }

  Text heading3() {
    return Text(
      text,
      style: const MyTextTheme().headlineSmall,
    );
  }

  Text paragraph() {
    return Text(
      text,
      style: const MyTextTheme().bodyMedium,
    );
  }

  Text captions() {
    return Text(
      text,
      style: const MyTextTheme().labelSmall,
    );
  }
}
