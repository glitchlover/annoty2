import 'package:annoty/core/constants/color/core.dart';
import 'package:annoty/core/constants/color/text.dart';
import 'package:annoty/core/theme/my_text_theme.dart';
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
    return Text(text, style: MyTextTheme().titleLarge);
  }

  Text heading1() {
    return Text(text, style: MyTextTheme().headlineLarge);
  }

  Text heading2() {
    return Text(text, style: MyTextTheme().headlineMedium);
  }

  Text heading3() {
    return Text(
      text,
      style: MyTextTheme().headlineSmall,
    );
  }

  Text paragraph() {
    return Text(
      text,
      style: MyTextTheme().bodyMedium,
    );
  }
  Text paragraphSmall() {
    return Text(
      text,
      style: MyTextTheme(color: ConstColorText.secondryDark).bodySmall,
    );
  }

  Text captions() {
    return Text(
      text,
      style: MyTextTheme(color: ConstColorMain.muteGrey).labelSmall,
    );
  }
}
