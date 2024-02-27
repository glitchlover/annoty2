part of annoty_controller;

class AnnotationSideBarController extends GetxController {
  final RxBool isAnnoBarOpen = false.obs;
  final Rx<Future<List<Annotation>>> annotations = LocalAnnotatonRepository()
      .getResourceFilteredAnnotation(kcAnnotyStudyEngine.pdfFile.path)
      .obs;
  final RxInt annotationLength = 0.obs;

  @override
  void onInit() async {
    annotationLength.value = (await annotations.value).length;
    super.onInit();
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
