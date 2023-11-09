import 'package:annoty/app/core/constants/color/core.dart';
import 'package:annoty/app/core/resources/logger/logger.dart';
import 'package:annoty/app/core/theme/my_text.dart';
import 'package:annoty/app/database/models/annotation.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/annotation_bar_controller.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/widgets/annotation_card.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class AnnotationSideBar extends GetView<AnnotationSideBarController> {
  const AnnotationSideBar({super.key});

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
                    const AnnotationSideBarHeader(),
                    AnnotationSidebarBody(controller: controller)
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

class AnnotationSidebarBody extends StatelessWidget {
  const AnnotationSidebarBody({
    super.key,
    required this.controller,
  });

  final AnnotationSideBarController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            color: ConstColorMain.activeBlack,
            child: Obx(() {
              return FutureBuilder<List<Annotation>>(
                  future: controller.annotations.value,
                  builder: (context, snapshot) {
                    return snapshot.connectionState == ConnectionState.waiting
                        ? const CircularProgressIndicator()
                        : ListView.builder(
                            itemCount: controller.annotationLength.value,
                            itemBuilder: (context, index) =>
                                AnnotationCard(index),
                          );
                  });
            })));
  }
}

class AnnotationSideBarHeader extends StatelessWidget {
  const AnnotationSideBarHeader({super.key});

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
