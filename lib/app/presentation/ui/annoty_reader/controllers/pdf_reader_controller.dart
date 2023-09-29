import 'dart:io';
import 'dart:typed_data';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/annotation_widget_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class AnnotyReaderController extends GetxController {
  late final File pdfFile;
  late final Uint8List pdfBytes;
  final PdfViewerController pdfViewerController = PdfViewerController();
  final AnnotationWidgetController annotationWidgetController =
      Get.find<AnnotationWidgetController>();

  @override
  void onInit() {
    setPdfDataAndBytes();
    super.onInit();
  }

  @override
  void onClose() {
    annotationWidgetController.checkAndCloseOverlayEntry();
    super.onClose();
  }

  void setPdfDataAndBytes() async {
    pdfFile = Get.arguments;
    pdfBytes = await pdfFile.readAsBytes();
    print("🐛 pdf file: $pdfFile");
  }

  void handleAnnotationWidget(
      PdfTextSelectionChangedDetails details, BuildContext context) {
    print("=" * 80);
    print("🌕 handleAnnotationWidget");
    if (details.selectedText == null &&
        annotationWidgetController.selectionOverlayEntry!.mounted) {
      annotationWidgetController.checkAndCloseOverlayEntry();
      pdfViewerController.clearSelection();
    } else if (details.selectedText != null &&
        !annotationWidgetController.selectionOverlayEntry!.mounted) {
      print("🐛 text selected");
      print(
          "🐛 details in 🌕handleAnnotaionWidget:  ${details.selectedText}, ${details.globalSelectedRegion!.top}");
      annotationWidgetController.showOverlay(
          context: context, details: details);
    }
    print("🟢 handleAnnotationWidget");
  }
}
