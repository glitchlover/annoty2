import 'package:annoty/app/presentation/ui/pdf_reader/controllers/annoty_pdf_study_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';
class PdfReaderPage extends GetView<AnnotyPdfStudyController> {
  const PdfReaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: PdfView(
            scrollDirection: Axis.vertical,
            controller: controller.pdfController,
          )),
        ],
      ),
    );
  }
}
