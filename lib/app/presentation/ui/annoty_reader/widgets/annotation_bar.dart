import 'package:annoty/app/core/constants/color/core.dart';
import 'package:annoty/app/core/constants/ui/sizing.dart';
import 'package:annoty/app/core/theme/my_text.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/annotation_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class AnnotationBar extends GetView<AnnotationBarController> {
  const AnnotationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Visibility(
        visible: controller.isAnnoBarOpen.value,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                width: 400.0,
                child: Column(
                  children: [
                    const AnnotationToolBar(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 50,
                        itemBuilder: (context, index) => Container(
                          color: ConstColorMain.backgroundDark,
                          padding: EdgeInsets.all(ConstSizing.size_2_2),
                          child: AnnotationCard(index)),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}

class AnnotationCard extends StatelessWidget {
  final int index;
  const AnnotationCard(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Container(
      child: MyText("Annotation $index").paragraph(),
    ));
  }
}

class AnnotationToolBar extends StatelessWidget {
  const AnnotationToolBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400.0,
        height: 40.0,
        alignment: Alignment.center,
        color: ConstColorMain.backgroundDark,
        child: const MyText("Annotation Bar").heading2()
        // Todo have to add annotation search bar
        );
  }
}
