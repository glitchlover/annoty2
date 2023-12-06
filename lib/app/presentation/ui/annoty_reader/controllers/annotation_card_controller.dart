import 'package:annoty/app/core/resources/logger/logger.dart';
import 'package:annoty/app/core/utils/file_utils.dart';
import 'package:annoty/app/database/models/annotation.dart';
import 'package:annoty/app/database/providers/local/annotation_repository.dart';
import 'package:annoty/app/domain/functions/annotation_usecase.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/annotation_bar_controller.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/annoty_study_engine_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';

class AnnotationCardController extends GetxController {
  RxList<bool> showOutlinkCard = List.filled(0, false).obs;
  SearchController searchController = SearchController();
  RxBool isAllCards = false.obs;
  List<Annotation> expectedResult = <Annotation>[];
  RxList<Annotation> filteredResult = <Annotation>[].obs;

  Future<List<Annotation>> getExpectedResult() async {
    String path = FileUtils.getFolderPath(Get.find<AnnotyStudyEngineController>().pdfFile.path);
    Flog.info(await LocalAnnotatonRepository().getResourceFilteredAnnotation(path));
    return expectedResult = isAllCards.isTrue
        ? await LocalAnnotatonRepository().getAllAnnotation()
        : await LocalAnnotatonRepository().getResourceFilteredAnnotation(path);
  }

  List<SearchFieldListItem<Annotation>> handleSearch(String typedText) {
    getExpectedResult();
    filteredResult = expectedResult
        .where((result) => result.text.toLowerCase().contains(typedText))
        .toList()
        .obs;

    Flog.info(filteredResult);
    return filteredResult
        .map((e) => SearchFieldListItem(e.text, item: e))
        .toList();
  }

  @override
  void onInit() async {
    showOutlinkCard.value = List.filled(
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

  toggleOutlinkCard(int index) {
    // Flog.debug(index);
    // Flog.debug(showOutlinkCard);
    showOutlinkCard[index] = !showOutlinkCard[index];
  }
}
