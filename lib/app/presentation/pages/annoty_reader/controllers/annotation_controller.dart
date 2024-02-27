part of annoty_controller;

class AnnotationController extends GetxController {
  late PdfDocument document;
  late PdfPage currentPage;
  late int pagenumber;
  final SfPdfViewerState? currentState = ConstKey.pdfKey.currentState;
  final Rx<Offset> scrollOffset = Offset.zero.obs;
  final RxDouble xOffset1 = (0.0).obs;
  final RxDouble yOffset1 = (0.0).obs;
  final RxDouble xOffset2 = (0.0).obs;
  final RxDouble yOffset2 = (0.0).obs;
  final Rx<Rect> bounds = Rect.zero.obs;
  late Color color;
  PdfColor get pdfColor =>
      PdfColor(color.red, color.green, color.blue, color.alpha);

  Future addAnnotationToPdf({
        required AnnotyStudyEngineController annotyReaderController,
        required PdfTextSelectionChangedDetails details,
        required Color color}) async {
    this.color = color;
    // Flog.mark("adding annotaion");
    await preTextAnnotationProcessor(details, annotyReaderController);
    await annotationGenerator(annotyReaderController);
    await postTextAnnotationProcessor(annotyReaderController);
    // annotyReaderController.handlePdfBytesChanging();
  }

  Future<void> postTextAnnotationProcessor(
        AnnotyStudyEngineController annotyReaderController) async {
    String text =
        currentState!.getSelectedTextLines().map((line) => line.text).join(" ");
    List<int> bytes = await document.save();
    annotyReaderController.pdfBytes.value = Uint8List.fromList(bytes);
    kcSidebar.addAnnotationCard(
        await AnnotationUseCase().addAnnotation(text, pagenumber));
    // annotyReaderController.handlePdfBytesChanging();
  }

  Future annotationGenerator(
      AnnotyStudyEngineController annotyReaderController) async {
    currentState!.getSelectedTextLines().forEach((line) async {
      // Flog.info(line.text);
      pagenumber = line.pageNumber;
      currentPage = document.pages[pagenumber];
      final PdfRectangleAnnotation annotation = PdfRectangleAnnotation(
          line.bounds, "Highlight",
          setAppearance: true,
          color: pdfColor,
          innerColor: pdfColor,
          opacity: 0.3);
      xOffset1.value = annotation.bounds.left;
      xOffset2.value = annotation.bounds.right;
      yOffset1.value = annotation.bounds.top;
      yOffset2.value = annotation.bounds.bottom;
      scrollOffset.value = kpdfViewerController.scrollOffset;
      currentPage.annotations.add(annotation);
      currentPage.annotations.flattenAllAnnotations();
    });
  }

  Future<void> preTextAnnotationProcessor(
      PdfTextSelectionChangedDetails details,
      AnnotyStudyEngineController annotyReaderController) async {
    await Clipboard.setData(ClipboardData(text: details.selectedText!));
    document = PdfDocument(inputBytes: annotyReaderController.pdfBytes.value);
  }

  Future deleteAnnotationFromPdf(Annotation annotation) async {
    // Todo: make annotation object have a real string
    kcAnnotyStudyEngine
        .pdfViewerController
        .jumpToPage(annotation.page+1);
    // PdfAnnotationCollection(Get.find<AnnotationController>().currentPage).remove(PdfRectangleAnnotation(
    //     Rect.fromPoints(
    //         Offset(annotation.bounds.target!.xOffset1,
    //             annotation.bounds.target!.yOffset1),
    //         Offset(annotation.bounds.target!.xOffset2,
    //             annotation.bounds.target!.yOffset2)),
    //     annotation.text));
    //Add: delete collection from
  }
}
