import 'package:annoty/app/presentation/ui/annoty_reader/controllers/tool_box_controller.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/pdf_reader_controller.dart';
import 'package:get/get.dart';

class PdfReaderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AnnotyReaderController());
    Get.lazyPut(() => ToolBoxController());
  }
}
