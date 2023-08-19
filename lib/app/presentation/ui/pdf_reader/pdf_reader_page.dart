import 'package:annoty/app/presentation/ui/pdf_reader/pdf_reader_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfReaderPage extends GetView<PdfReaderController> {
  const PdfReaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PdfReaderPage'),
      ),
      body: SfPdfViewer.file(
          controller.pdfFile,
          controller: PdfViewerController(),
        ),
    );
  }
}
