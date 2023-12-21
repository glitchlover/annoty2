import 'package:annoty/app/core/resources/enum/highlight.dart';
import 'package:annoty/app/core/utils/file_utils.dart';
import 'package:annoty/app/database/models/annotation.dart';
import 'package:annoty/app/database/models/annotation_bounds.dart';
import 'package:annoty/app/database/repositories/local/annotation_repository.dart';
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

  Future<Annotation> editAnnotation(Annotation annotation, String text) async {
    Annotation update = Annotation(
      id: annotation.id,
      text: text,
      keyWords: annotation.keyWords,
      createdDate: annotation.createdDate,
      modifiedDate: DateTime.now(),
      page: annotation.page,
      color: annotation.color,
    );
    update.bounds.target = annotation.bounds.target;
    update.comment.target = annotation.comment.target;
    update.resource.target = annotation.resource.target;
    update.outlinks.assignAll(annotation.outlinks.toList());
    update.tag.assignAll(annotation.tag.toList());
    LocalAnnotatonRepository().updateAnnotation(update);
    return update;
  }

  Future<void> linkAnnotation(
      {required Annotation sourceAnnotation,
      required Annotation linkedAnnotation}) async {
    sourceAnnotation.outlinks.add(linkedAnnotation);
    return LocalAnnotatonRepository().updateAnnotation(sourceAnnotation);
  }

  Future<void> deleteAnnotation(List<Annotation> annotations, index) async {
    await LocalAnnotatonRepository().deleteAnnotation(annotations[index]);
  }

  Future<void> commentAnnoattion(Annotation annotation) async {}
}
