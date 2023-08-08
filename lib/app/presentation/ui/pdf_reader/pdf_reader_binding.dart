import 'package:annoty/app/presentation/ui/pdf_reader/pdf_reader_controller.dart';
import 'package:get/get.dart';

class PdfReaderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PdfReaderController());
  }
}
