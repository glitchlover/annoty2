import 'package:annoty/app/core/constants/misc/key.dart';
import 'package:annoty/app/core/logger/logger.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/annoty_study_engine_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class AnnotationController extends GetxController {
  late PdfDocument document;
  late PdfPage currentPage;
  final SfPdfViewerState? currentState = KeyConst.pdfKey.currentState;
  final RxDouble xOffset = (0.0).obs;
  final RxDouble yOffset = (0.0).obs;

  Future addTextAnnotation(
      {required AnnotyStudyEngineController annotyReaderController,
      required PdfTextSelectionChangedDetails details,
      required Color color}) async {
    Flog.mark("adding annotaion");
    await preTextAnnotationProcessor(details, annotyReaderController);
    await annotationGenerator(annotyReaderController);
    postTextAnnotationProcessor(annotyReaderController);
    // annotyReaderController.handlePdfBytesChanging();
  }

  void postTextAnnotationProcessor(AnnotyStudyEngineController annotyReaderController) {
    xOffset.value =
        annotyReaderController.pdfViewerController.scrollOffset.dx;
    yOffset.value =
        annotyReaderController.pdfViewerController.scrollOffset.dy;
    xOffset.refresh();
    yOffset.refresh();
    List<int> bytes = document.saveSync();
    annotyReaderController.pdfBytes.value = Uint8List.fromList(bytes);
    // annotyReaderController.handlePdfBytesChanging();
  }

  Future annotationGenerator(
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
    });
  }

  Future<void> preTextAnnotationProcessor(
      PdfTextSelectionChangedDetails details,
      AnnotyStudyEngineController annotyReaderController) async {
    await Clipboard.setData(ClipboardData(text: details.selectedText!));
    document = PdfDocument(inputBytes: annotyReaderController.pdfBytes.value);
  }
}
