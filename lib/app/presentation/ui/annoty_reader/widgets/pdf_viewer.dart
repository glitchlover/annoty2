import 'package:annoty/app/core/constants/misc/key.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/annoty_study_engine_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends GetView<AnnotyStudyEngineController> {
  const PdfViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return SfPdfViewer.file(
      controller.pdfFile,
      key: KeyConst.pdfKey,
      controller: controller.pdfViewerController,
      enableTextSelection: true,
      onTextSelectionChanged: (details) => controller.handleAnnotationWidget(details, context),
    );
  }
}
