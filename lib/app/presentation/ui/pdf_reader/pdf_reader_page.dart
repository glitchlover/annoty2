import 'package:annoty/app/presentation/ui/pdf_reader/controllers/annoty_pdf_study_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfReaderPage extends GetView<AnnotyReaderController> {
  const PdfReaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SfPdfViewer.file(
              controller.pdfFile,
              controller: controller.sfPdfViewerController,
            ),
          ),
        ],
      ),
    );
  }
}
