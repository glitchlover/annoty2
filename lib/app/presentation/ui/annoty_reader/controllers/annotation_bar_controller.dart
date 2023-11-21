import 'package:annoty/app/core/utils/file_utils.dart';
import 'package:annoty/app/database/models/annotation.dart';
import 'package:annoty/app/database/providers/local/annotation_repository.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/annotation_controller.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/annoty_study_engine_controller.dart';
import 'package:get/get.dart';

class AnnotationSideBarController extends GetxController {
  final RxBool isAnnoBarOpen = false.obs;
  final Rx<Future<List<Annotation>>> annotations = LocalAnnotatonRepository()
      .getResourceFilteredAnnotation(FileUtils.getFolderPath(
          Get.find<AnnotyStudyEngineController>().pdfFile.path))
      .obs;
  final RxInt annotationLength = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    annotationLength.value = (await annotations.value).length;
  }

  Future addAnnotationCard(Annotation newannotation) async {
    (await annotations.value).add(newannotation);
    annotations.refresh();
    annotationLength.value = (await annotations.value).length;
    annotationLength.refresh();
  }

  Future delAnnotationCard(int index) async {
    Get.find<AnnotationController>()
        .deleteAnnotationFromPdf((await annotations.value)[index]);
    (await annotations.value).removeAt(index);
    annotations.refresh();
    annotationLength.value -= 1;
    annotationLength.refresh();
  }
}