import 'package:annoty/app/core/constants/misc/key.dart';
import 'package:annoty/app/core/resources/logger/logger.dart';
import 'package:annoty/app/domain/functions/annotation_usecase.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/annotation_bar_controller.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/annoty_study_engine_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class AnnotationController extends GetxController {
  late PdfDocument document;
  late PdfPage currentPage;
  final SfPdfViewerState? currentState = ConstKey.pdfKey.currentState;
  final RxDouble xOffset = (0.0).obs;
  final RxDouble yOffset = (0.0).obs;


  Future addTextAnnotation(
      {required AnnotyStudyEngineController annotyReaderController,
      required PdfTextSelectionChangedDetails details,
      required Color color}) async {
    Flog.mark("adding annotaion");
    await preTextAnnotationProcessor(details, annotyReaderController);
    await annotationGenerator(annotyReaderController);
    await postTextAnnotationProcessor(annotyReaderController);
    // annotyReaderController.handlePdfBytesChanging();
  }

  Future<void> postTextAnnotationProcessor(
      AnnotyStudyEngineController annotyReaderController) async {
    xOffset.value = annotyReaderController.pdfViewerController.scrollOffset.dx;
    yOffset.value = annotyReaderController.pdfViewerController.scrollOffset.dy;
    String text =
        currentState!.getSelectedTextLines().map((line) => line.text).join(" ");
    await Get.find<AnnotationSideBarController>()
        .updateAnnotation(await AnnotationUseCase().addAnnotation(text));
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
