import 'dart:io';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';

class AnnotyPdfStudyController extends GetxController {
  late final File pdfFile;
  late final PdfController pdfController;
  @override
  void onInit() {
    setPdfFile();
    openPdfFile();
    print(pdfFile);
    super.onInit();
  }

  void setPdfFile() {
    pdfFile = Get.arguments;
  }

  void openPdfFile() {
    pdfController = PdfController(
      document: PdfDocument.openFile(pdfFile.path),
    );
  }
}
