import 'package:annoty/app/database/models/annotation.dart';
import 'package:annoty/app/database/providers/local/annotation_repository.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/annoty_study_engine_controller.dart';
import 'package:get/get.dart';

class AnnotationSideBarController extends GetxController {
  final RxBool isAnnoBarOpen = false.obs;
  final Rx<Future<List<Annotation>>> annotations = LocalAnnotatonRepository()
      .getFilteredAnnotation(Get.find<AnnotyStudyEngineController>().pdfFile.path).obs;
  final RxInt annotationLength = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    annotationLength.value = (await annotations.value).length;
  }

  Future updateAnnotation(Annotation newannotation) async {
    (await annotations.value).add(newannotation);
    annotations.refresh();
    annotationLength.value = (await annotations.value).length;
    annotationLength.refresh();
  }
}
