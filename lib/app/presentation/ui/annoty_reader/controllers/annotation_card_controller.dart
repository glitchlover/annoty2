import 'package:annoty/app/core/constants/misc/objects.dart';
import 'package:annoty/app/core/utils/file_utils.dart';
import 'package:annoty/app/database/models/annotation.dart';
import 'package:annoty/app/database/repositories/local/annotation_repository.dart';
import 'package:annoty/app/domain/usecases/annotation_usecase.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/annotation_bar_controller.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/annoty_study_engine_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';

class AnnotationCardController extends GetxController {
  RxList<bool> showOutlinkCard = List.filled(0, false).obs;
  RxList<bool> isEditCard = List.filled(0, false).obs;
  TextEditingController searchController = SearchController();
  RxBool isAllCards = false.obs; //
  List<Annotation> allPossibleSuggestion = <Annotation>[];
  RxList<Annotation> suggestion = <Annotation>[].obs;
  late TextEditingController textEditingController;
  TextEditingController getTextEditingController(String text) =>
      textEditingController = TextEditingController(text: text);

  Future<List<Annotation>> getAllPossibleSuggestion() async {
    String path = FileUtils.getFolderPath(
        Get.find<AnnotyStudyEngineController>().pdfFile.path);
    return allPossibleSuggestion = isAllCards.isTrue
        ? await LocalAnnotatonRepository().getAllAnnotation()
        : await LocalAnnotatonRepository().getResourceFilteredAnnotation(path);
  }

  List<SearchFieldListItem<Annotation>> handleSearch(String typedText) {
    getAllPossibleSuggestion();
    suggestion = allPossibleSuggestion
        .where((result) => result.text.toLowerCase().contains(typedText))
        .toList()
        .obs;
    return suggestion.map((e) => SearchFieldListItem(e.text, item: e)).toList();
  }

  submitOutlink(int sourceIndex, Annotation? p0) async {
    p0 != null
        ? AnnotationUseCase().linkAnnotation(
            sourceAnnotation: (await annotations).elementAt(sourceIndex),
            linkedAnnotation: p0)
        : null;
    searchController.clear();
  }

  Future locateAnnotation(int index) async =>
    ConstObject.pdfViewerController
        .jumpToPage((await annotations)[index].page);

  @override
  void onInit() async {
    showOutlinkCard.value = List.filled(
        (await Get.find<AnnotationSideBarController>().annotations.value)
            .length,
        false);
    isEditCard.value = List.filled(
        (await Get.find<AnnotationSideBarController>().annotations.value)
            .length,
        false);
    super.onInit();
  }

  Future<List<Annotation>> get annotations async =>
      await Get.find<AnnotationSideBarController>().annotations.value;
  Future<List<Annotation>> getLinksOfAnnotaton(int index) async =>
      await AnnotationUseCase()
          .getOutlinkedAnnotations((await annotations)[index]) ??
      [];
  Future deleteCard(index) async {
    await AnnotationUseCase().deleteAnnotation(await annotations, index);
    Get.find<AnnotationSideBarController>().delAnnotationCard(index);
  }

  Future editCard(index) async {
    isEditCard[index] == true
        ? (await annotations)[index] = await AnnotationUseCase().editAnnotation(
            (await annotations).elementAt(index), textEditingController.text)
        : null;
    isEditCard[index] = !isEditCard[index];
  }

  toggleOutlinkCard(int index) {
    // Flog.debug(index);
    // Flog.debug(showOutlinkCard);
    showOutlinkCard[index] = !showOutlinkCard[index];
  }
}
