import 'package:annoty/app/presentation/ui/pdf_reader/controllers/pdf_data_controller.dart';
import 'package:annoty/app/presentation/ui/pdf_reader/controllers/annoty_pdf_study_controller.dart';
import 'package:get/get.dart';

class PdfReaderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AnnotyPdfStudyController());
    Get.lazyPut(() => PdfDataController());
  }
}
