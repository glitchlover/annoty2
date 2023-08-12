import 'package:annoty/app/core/constants/color/core.dart';
import 'package:annoty/app/presentation/shared/widget/my_text_field.dart';
import 'package:flutter/material.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({super.key});

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.all(8),
      height: 35,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
          color: MyCoreColor.highlightBlack,
          borderRadius: BorderRadius.circular(10)),
      child: const MyTextField()
      ));
  }
}