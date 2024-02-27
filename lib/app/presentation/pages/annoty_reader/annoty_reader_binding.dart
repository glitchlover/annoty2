import 'package:annoty/core/resources/logger/logger.dart';
import 'package:annoty/app/presentation/pages/annoty_reader/controllers/annoty_study_engine_controller.dart';
import 'package:get/get.dart';

class AnnotyReaderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AnnotyStudyEngineController());
    Get.lazyPut(() => TextPopUpWidgetController());
    Get.lazyPut(() => AnnotationController());
    Get.lazyPut(() => ToolBoxMenuController());
    Get.lazyPut(() => AnnotationSideBarController());
    Get.lazyPut(() => AnnotationCardController());
    Flog.success("Engine initialized");
  }
}
