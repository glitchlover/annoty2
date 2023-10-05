import 'package:annoty/app/core/constants/misc/key.dart';
import 'package:annoty/app/core/logger/logger.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/annoty_study_engine_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class AnnotationController extends GetxController {
  late PdfDocument document;
  late PdfPage currentPage;
  final SfPdfViewerState? currentState = KeyConst.pdfKey.currentState;

  Future addTextAnnotation(
      {required AnnotyStudyEngineController annotyReaderController,
      required PdfTextSelectionChangedDetails details,
      required Color color}) async {
    Flog.mark("adding annotaion");
    await preTextAnnotationProcessor(details, annotyReaderController);
    annotationGenerator(annotyReaderController);
  }

  void annotationGenerator(
      AnnotyStudyEngineController annotyReaderController) async {
    currentState!.getSelectedTextLines().forEach((line) async {
      Flog.info(line.text);
      currentPage = document.pages[line.pageNumber];
      final PdfRectangleAnnotation rectangleAnnotation = PdfRectangleAnnotation(
          line.bounds, "Highlight",
          color: PdfColor.fromCMYK(0, 0, 255, 0),
          innerColor: PdfColor.fromCMYK(0, 0, 255, 0),
          opacity: 0.3);
      currentPage.annotations.add(rectangleAnnotation);
      currentPage.annotations.flattenAllAnnotations();
      double xOffset =
          annotyReaderController.pdfViewerController.scrollOffset.dx;
      double yOffset =
          annotyReaderController.pdfViewerController.scrollOffset.dy;
      List<int> bytes = await document.save();
      annotyReaderController.pdfBytes.value = Uint8List.fromList(bytes);
    });
  }

  Future<void> preTextAnnotationProcessor(
      PdfTextSelectionChangedDetails details,
      AnnotyStudyEngineController annotyReaderController) async {
    await Clipboard.setData(ClipboardData(text: details.selectedText!));
    document = PdfDocument(inputBytes: annotyReaderController.pdfBytes.value);
  }
}
