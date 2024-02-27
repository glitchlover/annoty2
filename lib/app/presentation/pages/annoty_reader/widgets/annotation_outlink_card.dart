import 'package:annoty/core/constants/ui/sizing.dart';
import 'package:annoty/core/theme/my_text.dart';
import 'package:annoty/app/database/models/annotation.dart';
import 'package:annoty/app/presentation/shared/widget/my_box_decoration.dart';
import 'package:annoty/app/presentation/pages/annoty_reader/controllers/annoty_study_engine_controller.dart';
import 'package:annoty/app/presentation/pages/annoty_reader/widgets/annotation_card_tool.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';

class AnnotationOutlinkCardListView extends GetView<AnnotationCardController> {
  final int index;
  const AnnotationOutlinkCardListView({required this.index, super.key});

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
              AnnotationOutlinkCardList(controller: controller, index: index),
              SizedBox(height: ConstSizing.size_2_2),
              AnnotationSearchField(controller: controller, index: index),
              SizedBox(height: ConstSizing.size_4_2)
            ],
          ));
    });
  }
}

class AnnotationSearchField extends StatelessWidget {
  const AnnotationSearchField({
    super.key,
    required this.controller,
    required this.index,
  });

  final AnnotationCardController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SearchField<Annotation>(
      controller: controller.searchController,
      searchInputDecoration: const InputDecoration(
          filled: true,
          border: InputBorder.none,
          hintText: "search annotation"),
      onSearchTextChanged: controller.handleSearch,
      onSuggestionTap: (p0) async =>
          await controller.submitOutlink(index, p0.item),
      suggestions: controller.allPossibleSuggestion.map((e) {
        controller.getAllPossibleSuggestion();
        return SearchFieldListItem(e.text, item: e);
      }).toList(),
    );
  }
}

class AnnotationOutlinkCardList extends StatelessWidget {
  const AnnotationOutlinkCardList({
    super.key,
    required this.controller,
    required this.index,
  });

  final AnnotationCardController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Annotation>>(
        future: controller.getLinksOfAnnotaton(index),
        builder: (context, snapshot) {
          return snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData
              ? AnnotationOutlinkCard(
                  snapshot: snapshot,
                  controller: controller,
                )
              : !snapshot.hasData
                  ? const NoDataWidget()
                  : const CircularProgressIndicator();
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
  final AnnotationCardController controller;
  const AnnotationOutlinkCard({
    required this.controller,
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
                child: Row(
                  children: [
                    Expanded(
                      child:
                          MyText(snapshot.data![index].text).paragraphSmall(),
                    ),
                    //todo 
                    MyMinimalIconButton(icon: Icons.cancel, onTap: () {}),
                  ],
                ))));
  }
}
