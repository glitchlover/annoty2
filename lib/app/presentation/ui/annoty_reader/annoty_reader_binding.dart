import 'package:annoty/app/presentation/ui/annoty_reader/controllers/annotation_controller.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/text_popup_widget_controller.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/tool_box_menu_controller.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/annoty_study_engine_controller.dart';
import 'package:get/get.dart';

class AnnotyReaderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AnnotyStudyEngineController());
    Get.lazyPut(() => TextPopUpWidgetController());
    Get.lazyPut(() => AnnotationController());
    Get.lazyPut(() => ToolBoxMenuController());
  }
}
