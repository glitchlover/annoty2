import 'package:annoty/app/core/constants/color/highlights.dart';
import 'package:annoty/app/core/constants/ui/sizing.dart';
import 'package:annoty/app/core/theme/my_text.dart';
import 'package:annoty/app/database/models/annotation.dart';
import 'package:annoty/app/presentation/shared/widget/my_icon_button.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/annotation_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnnotationCard extends GetView<AnnotationCardController> {
  final int index;
  const AnnotationCard(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ConstColorHighlight.yellow.withOpacity(0.5),
      margin: EdgeInsets.all(ConstSizing.size_4_1),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 0.0, top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<List<Annotation>>(
              future: controller.annotations,
              builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                ? CircularProgressIndicator()
                : MyText(snapshot.data![index].text).paragraph();
              }
            ),
            SizedBox(height: ConstSizing.size_4_2),
            AnnotationTool()
          ],
        ),
      ),
    );
  }
}

class AnnotationTool extends StatelessWidget {
  const AnnotationTool({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      MyIconButton(
          icon: Icon(
            Icons.center_focus_strong,
            size: 14,
          ),
          onPressed: () {}),
      MyIconButton(
          icon: Icon(
            Icons.comment,
            size: 14,
          ),
          onPressed: () {}),
      MyIconButton(
          icon: Icon(
            Icons.tag,
            size: 14,
          ),
          onPressed: () {}),
      MyIconButton(
          icon: Icon(
            Icons.link,
            size: 14,
          ),
          onPressed: () {}),
      MyIconButton(
          icon: Icon(
            Icons.bolt,
            size: 14,
          ),
          onPressed: () {}),
      MyIconButton(
          icon: Icon(
            Icons.menu,
            size: 14,
          ),
          onPressed: () {}),
    ]);
  }
}

class AnnotationCardController extends GetxController {
  Future<List<Annotation>> get annotations async => await Get.find<AnnotationSideBarController>().annotations.value;
}
