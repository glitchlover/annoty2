import 'package:annoty/app/core/constants/color/core.dart';
import 'package:annoty/app/core/constants/color/highlights.dart';
import 'package:annoty/app/core/constants/color/ui_element.dart';
import 'package:annoty/app/core/constants/misc/key.dart';
import 'package:annoty/app/core/constants/ui/sizing.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/pdf_reader_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ShowContextMenu {
  OverlayEntry? selectionOverlayEntry;
  Color? contextMenuColor = MyCoreColor.backgroundDark;
  Color? copyTextColor = MyCoreColor.backgroundDark;

  void handleContextMenuClose() {
    if (selectionOverlayEntry != null) {
      print("handling");
      selectionOverlayEntry?.remove();
      selectionOverlayEntry = null;
    }
  }

  void showContextMenu(
      {required BuildContext context,
      required PdfTextSelectionChangedDetails details}) {
    AnnotyReaderController annotyReaderController =
        Get.find<AnnotyReaderController>();
    final RenderBox? renderBoxContainer =
        context.findRenderObject()! as RenderBox?;
    if (renderBoxContainer != null) {
      overlayEntryWidget(details, context, annotyReaderController);
    }
  }

  void overlayEntryWidget(PdfTextSelectionChangedDetails details, BuildContext context, AnnotyReaderController annotyReaderController) {
    final List<BoxShadow> boxShadows = MyUiElement().shadow;
    final double top = details.globalSelectedRegion!.top - 55;
    final double left = details.globalSelectedRegion!.center.dx;
    final OverlayState overlayState = Overlay.of(context, rootOverlay: true);
    selectionOverlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
        top: top,
        left: left,
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: contextMenuColor,
            boxShadow: boxShadows,
          ),
          constraints: BoxConstraints(
              maxWidth: SizingUiCore.size_4_1 * 50,
              maxHeight: SizingUiCore.size_4_1 * 12
              ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child: const Icon(Icons.square_rounded,
                        color: HighlightColorConstant.kPurp),
                    onTap: () async {
                      addAnnote(
                          annotyReaderController: annotyReaderController,
                          details: details,
                          color: HighlightColorConstant.kPurp);
                    },
                  )),
              MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child: const Icon(Icons.square_rounded,
                        color: HighlightColorConstant.kBlue),
                    onTap: () async {
                      addAnnote(
                          annotyReaderController: annotyReaderController,
                          details: details,
                          color: HighlightColorConstant.kBlue);
                    },
                  )),
              MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child: const Icon(Icons.square_rounded,
                        color: HighlightColorConstant.kGreen),
                    onTap: () async {
                      addAnnote(
                          annotyReaderController: annotyReaderController,
                          details: details,
                          color: HighlightColorConstant.kGreen);
                    },
                  )),
              MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child: const Icon(Icons.square_rounded,
                        color: HighlightColorConstant.kYellow),
                    onTap: () async {
                      addAnnote(
                          annotyReaderController: annotyReaderController,
                          details: details,
                          color: HighlightColorConstant.kYellow);
                    },
                  )),
              MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child: const Icon(Icons.square_rounded,
                        color: HighlightColorConstant.kRed),
                    onTap: () async {
                      addAnnote(
                          annotyReaderController: annotyReaderController,
                          details: details,
                          color: HighlightColorConstant.kRed);
                    },
                  )),
              MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child: const Icon(Icons.copy_rounded),
                    onTap: () async {
                      await Clipboard.setData(
                          ClipboardData(text: details.selectedText!));
                    },
                  )),
            ],
          ),
        ),
      ),
    );
    overlayState.insert(selectionOverlayEntry!);
  }

  void addAnnote({
    required AnnotyReaderController annotyReaderController,
    required PdfTextSelectionChangedDetails details,
    required Color color
    }) async {
    await Clipboard.setData(ClipboardData(text: details.selectedText!));
    final PdfDocument document =
        PdfDocument(inputBytes: await annotyReaderController.pdfFile.readAsBytes());
    KeyConst.pdfKey.currentState!
        .getSelectedTextLines()
        .forEach((element) {
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
}
