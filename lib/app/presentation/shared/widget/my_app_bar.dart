import 'package:flutter/material.dart';
import 'package:annoty/app/core/theme/my_text.dart';

class MyAppBar{

  List<Widget> actions;
  Widget? leading;
  String? text;
  MyAppBar({
    required this.actions,
    this.leading,
    this.text,
  });
  AppBar paint() {
    return AppBar(
      title: MyText(text ?? "").paragraph(),
      actions: actions,
      leading: leading??const Text(""),
      // backgroundColor: Color.fromARGB(255, 33, 37, 62),
    );
  }
}
