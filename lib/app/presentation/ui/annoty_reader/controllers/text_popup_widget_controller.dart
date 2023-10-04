import 'package:annoty/app/core/constants/color/core.dart';
import 'package:annoty/app/core/constants/color/highlights.dart';
import 'package:annoty/app/core/constants/color/ui_element.dart';
import 'package:annoty/app/core/constants/misc/key.dart';
import 'package:annoty/app/core/constants/ui/sizing.dart';
import 'package:annoty/app/core/logger/logger.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/annoty_study_engine_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class TextPopUpWidgetController extends GetxController {
  late Rx<OverlayEntry> textPopUpEntry;
  Rx<bool> textPopUpMounted = false.obs;
  Color? contextMenuColor = MyCoreColor.backgroundDark;
  Color? copyTextColor = MyCoreColor.backgroundDark;
  late BuildContext context;

  @override
  onInit() {
    textPopUpEntry = OverlayEntry(builder: (_) => Container()).obs;
    super.onInit();
  }

  void checkAndClosePopUpEntry() {
    if (textPopUpMounted.value) {
      textPopUpEntry.value.remove();
      textPopUpEntry.value.dispose();
      textPopUpMounted.value = false;
      textPopUpEntry.refresh();
    }
  }

  void renderTextPopUp(
      {required BuildContext context,
      required PdfTextSelectionChangedDetails details}) {
    this.context = context;
    textPopUpEntry.value = createOverlayEntryWidgetAsTextPopUp(details);
    Overlay.of(context, rootOverlay: true).insert(textPopUpEntry.value);
    textPopUpMounted.value = true;
  }

  OverlayEntry createOverlayEntryWidgetAsTextPopUp(
      PdfTextSelectionChangedDetails details) {
    Flog.mark("");
    final List<BoxShadow> boxShadow = MyUiElement().shadow;
    final (top, left) = getPosition(details);
    final AnnotyStudyEngineController annotyReaderController =
        Get.find<AnnotyStudyEngineController>();

    return OverlayEntry(
      builder: (BuildContext context) => Positioned(
        top: top,
        left: left,
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: contextMenuColor,
            boxShadow: boxShadow,
          ),
          constraints: BoxConstraints(
              maxWidth: SizingUiCore.size_4_1 * 50,
              maxHeight: SizingUiCore.size_4_1 * 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                child: const Icon(Icons.square_rounded,
                    color: HighlightColorConstant.kPurp),
                onPressed: () async {
                  addAnnote(
                      annotyReaderController: annotyReaderController,
                      details: details,
                      color: HighlightColorConstant.kPurp);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addAnnote(
      {required AnnotyStudyEngineController annotyReaderController,
      required PdfTextSelectionChangedDetails details,
      required Color color}) async {
    Flog.mark("adding annotaion");
    await Clipboard.setData(ClipboardData(text: details.selectedText!));
    final PdfDocument document = PdfDocument(
        inputBytes: await annotyReaderController.pdfFile.readAsBytes());
    KeyConst.pdfKey.currentState!.getSelectedTextLines().forEach((element) {
      final PdfPage page = document.pages[element.pageNumber];
      final PdfRectangleAnnotation rectangleAnnotation = PdfRectangleAnnotation(
        element.bounds,
        details.selectedText!,
        color: PdfColor(color.red, color.green, color.blue),
        opacity: 0.5,
      );
      page.annotations.add(rectangleAnnotation);
    });
    final List<int> bytes = document.saveSync();
    annotyReaderController.pdfBytes = Uint8List.fromList(bytes);
    annotyReaderController.update();
  }

  (double, double) getPosition(details) {
    final RenderBox renderBoxContainer =
        // ignore: avoid_as
        context.findRenderObject()! as RenderBox;
    final Offset containerOffset = renderBoxContainer.localToGlobal(
      renderBoxContainer.paintBounds.topLeft,
    );
    if (containerOffset.dy < details.globalSelectedRegion!.topLeft.dy - 55 ||
        (containerOffset.dy <
                details.globalSelectedRegion!.center.dy - (48 / 2) &&
            details.globalSelectedRegion!.height > 100)) {
      double top = 0.0;
      double left = 0.0;
      if ((details.globalSelectedRegion!.top) >
          MediaQuery.of(context).size.height / 2) {
        top = details.globalSelectedRegion!.topLeft.dy - 55;
        left = details.globalSelectedRegion!.bottomLeft.dx;
        return (top, left);
      } else {
        top = details.globalSelectedRegion!.height > 100
            ? details.globalSelectedRegion!.center.dy - (48 / 2)
            : details.globalSelectedRegion!.topLeft.dy - 55;
        left = details.globalSelectedRegion!.height > 100
            ? details.globalSelectedRegion!.center.dx - (100 / 2)
            : details.globalSelectedRegion!.bottomLeft.dx;
        return (top, left);
      }
    }
    return (0.0, 0.0);
  }
}
