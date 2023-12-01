import 'package:annoty/app/core/resources/logger/logger.dart';
import 'package:annoty/app/database/models/annotation.dart';
import 'package:annoty/app/domain/functions/annotation_usecase.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/annotation_bar_controller.dart';
import 'package:get/get.dart';

class AnnotationCardController extends GetxController {
  RxList<bool> showOutlinkCard = List.filled(0, false).obs;

  @override
  void onInit() async {
    super.onInit();

    showOutlinkCard.value = List.filled(
        (await Get.find<AnnotationSideBarController>().annotations.value)
            .length,
        false);
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
    Flog.debug(index);
    Flog.debug(showOutlinkCard);
    showOutlinkCard[index] = !showOutlinkCard[index];
  }
}
