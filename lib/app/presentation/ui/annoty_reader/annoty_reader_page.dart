import 'package:annoty/app/presentation/ui/annoty_reader/controllers/pdf_reader_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class AnnotyReaderPage extends GetView<AnnotyReaderController> {
  const AnnotyReaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolMenu(), 
      body: SfPdfViewer.file(
        controller.pdfFile,
        controller: controller.sfPdfViewerController,
        )
      );
  }
}

class ToolMenu extends AppBar {
  ToolMenu({super.key});
}
