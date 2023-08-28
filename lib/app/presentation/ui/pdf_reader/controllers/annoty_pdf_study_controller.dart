import 'dart:io';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class AnnotyReaderController extends GetxController {
  late final File pdfFile;
  final PdfViewerController sfPdfViewerController = PdfViewerController();

  @override
  void onInit() {
    setPdfData();
    print(pdfFile);
    super.onInit();
  }

  void setPdfData() {
    pdfFile = Get.arguments;
  }
}
