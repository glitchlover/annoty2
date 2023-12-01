import 'package:annoty/app/core/constants/color/core.dart';
import 'package:annoty/app/core/constants/ui/sizing.dart';
import 'package:annoty/app/presentation/shared/widget/my_box_decoration.dart';
import 'package:annoty/app/presentation/shared/widget/my_icon_button.dart';
import 'package:annoty/app/presentation/shared/widget/my_text_field.dart';
import 'package:annoty/app/presentation/ui/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnnotySearchTool extends GetView<HomeController> {
  const AnnotySearchTool({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AnnotySearchBar(),
            MyIconButton(icon: const Icon(Icons.tune_rounded), onPressed: () {})
          ],
        )
      ],
    );
  }
}


class AnnotySearchBar extends StatefulWidget {
  const AnnotySearchBar({super.key});

  @override
  State<AnnotySearchBar> createState() => _AnnotySearchBarState();
}

class _AnnotySearchBarState extends State<AnnotySearchBar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(vertical: SpaceSizing.secondaryPadding),
        margin: const EdgeInsets.all(8),
        height: 35,
            decoration: MyBoxDecoration().uncontrasted(),
        child: const MyTextField(
              preffixIcon: Icon(Icons.search, color: ConstColorMain.muteGrey),
          hintText: "Search",
        )
      )
    );
  }


}