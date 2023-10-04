import 'dart:io';
import 'dart:typed_data';
import 'package:annoty/app/core/logger/logger.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/text_popup_widget_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class AnnotyStudyEngineController extends GetxController {
  late final File pdfFile;
  late Uint8List pdfBytes;
  final Rx<PdfTextSelectionChangedDetails> lastDetails =
      PdfTextSelectionChangedDetails(null, null).obs;
  final PdfViewerController pdfViewerController = PdfViewerController();
  final TextPopUpWidgetController annotationWidgetController =
      Get.find<TextPopUpWidgetController>();

  @override
  void onInit() {
    setPdfDataAndBytes();
    super.onInit();
  }

  @override
  void onClose() {
    annotationWidgetController.checkAndClosePopUpEntry();
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
        annotationWidgetController.textPopUpMounted.value == true) {
      annotationWidgetController.checkAndClosePopUpEntry();
      pdfViewerController.clearSelection();
    } else if (details.selectedText != null &&
        annotationWidgetController.textPopUpMounted.value == false) {
      Flog.debug("🐛 text selected");
      Flog.debug(
          "🐛 details in 🌕handleAnnotaionWidget:  ${details.selectedText}, ${details.globalSelectedRegion.toString()}");
      annotationWidgetController.renderTextPopUp(
          context: context, details: details);
    }
    lastDetails.value = details;
    lastDetails.refresh();
    Flog.success("🟢 handleAnnotationWidget");
  }
}
