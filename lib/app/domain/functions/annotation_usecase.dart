import 'package:annoty/app/core/resources/enum/highlight.dart';
import 'package:annoty/app/core/utils/file_utils.dart';
import 'package:annoty/app/database/models/annotation.dart';
import 'package:annoty/app/database/models/annotation_bounds.dart';
import 'package:annoty/app/database/providers/local/annotation_repository.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/annotation_controller.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/annoty_study_engine_controller.dart';
import 'package:get/get.dart';

class AnnotationUseCase {
  Future<List<Annotation>?> getOutlinkedAnnotations(Annotation annotation) {
    return LocalAnnotatonRepository()
        .getAnnotaitonFilteredAnnotations(annotation);
  }

  Future<Annotation> addAnnotation(String text, int page) async {
    AnnotationController getAnno = Get.find<AnnotationController>();
    return LocalAnnotatonRepository().addAnnotation(
        Annotation(
          text: text,
          keyWords: "",
          createdDate: DateTime.now(),
          modifiedDate: DateTime.now(),
          page: page,
          color: mapColorToHighlight[getAnno.color]!,
        ),
        FileUtils.getFolderPath(
            Get.find<AnnotyStudyEngineController>().pdfFile.path),
        AnnotationBounds(
            xOffset1: getAnno.xOffset1.value,
            xOffset2: getAnno.xOffset2.value,
            yOffset1: getAnno.yOffset1.value,
            yOffset2: getAnno.yOffset2.value));
  }

  Future<void> editAnnotation(Annotation annotation) async {}

  Future<void> linkAnnotation(Annotation annotation) async {}

  Future<void> deleteAnnotation(List<Annotation> annotations, index) async {
    await LocalAnnotatonRepository().deleteAnnotation(annotations[index]);
  }

  Future<void> commentAnnoattion(Annotation annotation) async {}
}
