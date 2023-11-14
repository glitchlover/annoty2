import 'package:annoty/app/core/constants/color/core.dart';
import 'package:annoty/app/core/constants/color/highlights.dart';
import 'package:annoty/app/core/constants/ui/sizing.dart';
import 'package:annoty/app/core/theme/my_text.dart';
import 'package:annoty/app/database/models/annotation.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/annotation_card_controller.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/widgets/annotation_card_tool.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnnotationCard extends GetView<AnnotationCardController> {
  final int index;
  const AnnotationCard(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: BoxDecoration(
        border: const Border(
            left: BorderSide(
                color: ConstColorHighlight.yellow,
                width: 5,
                style: BorderStyle.solid)),
        color: ConstColorMain.muteBlack,
      ),
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
                      ? const CircularProgressIndicator()
                      : MyText(snapshot.data![index].text).paragraph();
                }),
            SizedBox(height: ConstSizing.size_4_2),
            AnnotationCardTool(index)
          ],
        ),
      ),
    );
  }
}
