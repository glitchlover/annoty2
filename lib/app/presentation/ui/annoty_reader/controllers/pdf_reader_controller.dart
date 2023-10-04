import 'dart:io';
import 'dart:typed_data';
import 'package:annoty/app/core/logger/logger.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/annotation_widget_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class AnnotyReaderController extends GetxController {
  late final File pdfFile;
  late final Uint8List pdfBytes;
  final Rx<PdfTextSelectionChangedDetails> lastDetails =
      PdfTextSelectionChangedDetails(null, null).obs;
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
    // Overlay.maybeOf(annotationWidgetController.context)?.dispose();
    super.onClose();
  }

  void setPdfDataAndBytes() async {
    pdfFile = Get.arguments;
    pdfBytes = await pdfFile.readAsBytes();
    Flog.debug("pdf file: $pdfFile");
  }

  void handleAnnotationWidget(
      PdfTextSelectionChangedDetails details, BuildContext context) {
    Flog.mark("handling annotation widget");
    if (details == lastDetails.value) return;
    if (details.selectedText == null &&
        annotationWidgetController.overlayMounted.value == true) {
      annotationWidgetController.checkAndCloseOverlayEntry();
      pdfViewerController.clearSelection();
    } else if (details.selectedText != null &&
        annotationWidgetController.overlayMounted.value == false) {
      Flog.debug("🐛 text selected");
      Flog.debug(
          "🐛 details in 🌕handleAnnotaionWidget:  ${details.selectedText}, ${details.globalSelectedRegion!.top}");
      annotationWidgetController.showOverlay(
          context: context, details: details);
    }
    lastDetails.value = details;
    lastDetails.refresh();
    Flog.success("🟢 handleAnnotationWidget");
  }
}
