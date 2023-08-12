import 'package:annoty/app/core/constants/color/core.dart';
import 'package:annoty/app/presentation/shared/widget/my_text_field.dart';
import 'package:flutter/material.dart';

class AnnotySearchBar extends StatefulWidget {
  const AnnotySearchBar({super.key});

  @override
  State<AnnotySearchBar> createState() => _AnnotySearchBarState();
}

class _AnnotySearchBarState extends State<AnnotySearchBar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: 
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 0, top: 4, right: 0, bottom: 4),
        margin: const EdgeInsets.all(8),
        height: 35,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
            color: MyCoreColor.highlightBlack,
            borderRadius: BorderRadius.circular(10)),
        child: const MyTextField(
          preffixIcon : Icon(Icons.search, color: MyCoreColor.muteGrey),
          hintText: "Search",
        )
        ));
  }
}