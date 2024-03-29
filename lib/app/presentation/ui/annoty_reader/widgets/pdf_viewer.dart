import 'package:annoty/app/core/constants/misc/key.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/annoty_study_engine_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends GetView<AnnotyStudyEngineController> {
  const PdfViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SfPdfViewer.memory(
        controller.pdfBytes.value,
        key: ConstKey.pdfKey,
        controller: controller.pdfViewerController,
        enableTextSelection: true,
        initialZoomLevel: 1.5,
        onDocumentLoaded: (details) => controller.onDocumentLoaded(),
        onTextSelectionChanged: (details) =>
            controller.handleTextPopUpWidget(details, context),
      );
    });
  }
}
