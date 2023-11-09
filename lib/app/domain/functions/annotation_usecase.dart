// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:annoty/app/database/models/annotation.dart';
import 'package:annoty/app/database/providers/local/annotation_repository.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/annotation_controller.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/annoty_study_engine_controller.dart';
import 'package:get/get.dart';

class AnnotationUseCase {
  Future<Annotation> addAnnotation(String text) async {
    return LocalAnnotatonRepository().saveAnnotation(
        Annotation(
            text: text,
            keyWords: "",
            createdDate: DateTime.now(),
            modifiedDate: DateTime.now(),
            annoLocation: [
              Get.find<AnnotationController>().xOffset.value,
              Get.find<AnnotationController>().yOffset.value
            ]),
        Get.find<AnnotyStudyEngineController>().pdfFile.path);
  }

  Future<void> editAnnotation(Annotation annotation) async {}

  Future<void> linkAnnotation(Annotation annotation) async {}

  Future<void> deleteAnnotation(Annotation annotation) async {}

  Future<void> commentAnnoattion(Annotation annotation) async {}
}
