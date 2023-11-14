import 'package:annoty/app/database/models/annotation.dart';
import 'package:annoty/app/domain/functions/annotation_usecase.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/annotation_bar_controller.dart';
import 'package:get/get.dart';

class AnnotationCardController extends GetxController {
  Future<List<Annotation>> get annotations async =>
      await Get.find<AnnotationSideBarController>().annotations.value;
  Future deleteCard(index) async {
    await AnnotationUseCase().deleteAnnotation(
        await Get.find<AnnotationSideBarController>().annotations.value, index);
    Get.find<AnnotationSideBarController>().delAnnotationCard(index);
  }
}
