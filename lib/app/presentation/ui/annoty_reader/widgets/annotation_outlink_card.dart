import 'package:annoty/app/core/constants/ui/sizing.dart';
import 'package:annoty/app/core/resources/logger/logger.dart';
import 'package:annoty/app/core/theme/my_text.dart';
import 'package:annoty/app/database/models/annotation.dart';
import 'package:annoty/app/presentation/shared/widget/my_box_decoration.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/annotation_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:searchfield/searchfield.dart';

class AnnotationOutlinkCardList extends GetView<AnnotationCardController> {
  final int index;
  const AnnotationOutlinkCardList({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Visibility(
          visible: controller.showOutlinkCard[index],
          maintainState: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FutureBuilder<List<Annotation>>(
                  future: controller.getLinksOfAnnotaton(index),
                  builder: (context, snapshot) {
                    return snapshot.connectionState == ConnectionState.done &&
                            snapshot.hasData
                        ? AnnotationOutlinkCard(snapshot: snapshot)
                        : !snapshot.hasData
                            ? const NoDataWidget()
                            : const CircularProgressIndicator();
                  }),
              SearchField<Annotation>(
                onSearchTextChanged: controller.handleSearch,
                onTapOutside: (p0) => Flog.debug(controller.expectedResult),
                suggestionState: Suggestion.expand,
                suggestions: controller.expectedResult.map((e) {
                  controller.getExpectedResult();
                  return SearchFieldListItem(e.text, item: e);
                }).toList(),
              ),
              SizedBox(
                height: ConstSizing.size_4_2,
              )
            ],
          ));
    });
  }
}

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(ConstSizing.size_4_3),
        margin: EdgeInsets.zero,
        child: const MyText("No data is found").captions());
  }
}

class AnnotationOutlinkCard extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const AnnotationOutlinkCard({
    required this.snapshot,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: snapshot.data!.length,
        itemBuilder: (_, index) => Card(
            shadowColor: Colors.transparent,
            semanticContainer: false,
            child: Container(
                padding: EdgeInsets.all(ConstSizing.size_4_1),
                margin: EdgeInsets.zero,
                decoration: MyBoxDecoration().uncontrasted(radius: 5.0),
                child: MyText(snapshot.data![index].text).paragraphSmall())));
  }
}
