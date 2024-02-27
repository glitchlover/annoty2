import 'package:annoty/core/constants/color/core.dart';
import 'package:annoty/core/constants/ui/sizing.dart';
import 'package:annoty/core/resources/enum/highlight.dart';
import 'package:annoty/core/theme/my_text.dart';
import 'package:annoty/app/database/models/annotation.dart';
import 'package:annoty/app/presentation/pages/annoty_reader/controllers/annoty_study_engine_controller.dart';
import 'package:annoty/app/presentation/pages/annoty_reader/widgets/annotation_card_tool.dart';
import 'package:annoty/app/presentation/pages/annoty_reader/widgets/annotation_outlink_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnnotationCard extends GetView<AnnotationCardController> {
  final int index;
  const AnnotationCard(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Annotation>>(
        future: controller.annotations,
        builder: (context, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? const CircularProgressIndicator()
              : Container(
                  decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(
                            color: mapHighlightToColor[
                                snapshot.data![index].color]!,
                            width: 5,
                            style: BorderStyle.solid)),
                    color: ConstColorMain.muteBlack,
                  ),
                  margin: EdgeInsets.all(ConstSizing.size_4_1),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, bottom: 0.0, top: 8.0),
                    child: Obx(() {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          controller.isEditCard[index] == false
                              ? MyText(snapshot.data![index].text).paragraph()
                              : TextField(controller: controller.getTextEditingController(snapshot.data![index].text)),
                          SizedBox(height: ConstSizing.size_4_2),
                          AnnotationCardTool(index),
                          AnnotationOutlinkCardListView(index: index),
                        ],
                      );
                    }),
                  ),
                );
        });
  }
}
