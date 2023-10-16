import 'dart:io';

import 'package:annoty/app/core/logger/logger.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/annotation_controller.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/text_popup_widget_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class AnnotyStudyEngineController extends GetxController {
  final Rx<PdfTextSelectionChangedDetails> lastDetails =
      PdfTextSelectionChangedDetails(null, null).obs;
  final PdfViewerController pdfViewerController = PdfViewerController();
  final TextPopUpWidgetController popUpWidgetController =
      Get.find<TextPopUpWidgetController>();
  late final File pdfFile;
  final Rx<Uint8List> pdfBytes = Rx(Get.arguments);

  @override
  void onInit() {
    pdfBytes.value = Get.arguments;
    pdfFile = File(Get.parameters["pdfFile"]!);
    super.onInit();
  }

  @override
  void onClose() async{
    popUpWidgetController.checkAndClosePopUpEntry(pdfViewerController);
    await pdfFile.writeAsBytes(pdfBytes.value);
    super.onClose();
  }

  void handleTextPopUpWidget(
      PdfTextSelectionChangedDetails details, BuildContext context) {
    Flog.mark("handling annotation widget");
    if (details == lastDetails.value) return;
    if (details.selectedText == null &&
        popUpWidgetController.textPopUpMounted.value == true) {
      popUpWidgetController.checkAndClosePopUpEntry(pdfViewerController);
    } else if (details.selectedText != null &&
        popUpWidgetController.textPopUpMounted.value == false) {
      Flog.debug("🐛 text selected");
      Flog.debug(
          "🐛 details in 🌕handleAnnotaionWidget:  ${details.selectedText}, ${details.globalSelectedRegion.toString()}");
      popUpWidgetController.renderTextPopUp(context: context, details: details);
    }
    lastDetails.value = details;
    lastDetails.refresh();
    Flog.success("🟢 handleAnnotationWidget");
  }

  void jumpToPreviousOffset() {
    AnnotationController annotationController =
        Get.find<AnnotationController>();
    pdfViewerController.jumpTo(
        xOffset: annotationController.xOffset.value,
        yOffset: Get.find<AnnotationController>().yOffset.value);
  }
}
