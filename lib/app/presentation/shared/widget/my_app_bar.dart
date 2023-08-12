import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  @override
  Size get preferredSize => const Size.fromHeight(40);
  

  MyAppBar({
    super.key,
    required super.actions,
    super.leading,
    super.title,
  });
}
