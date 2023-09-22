import 'package:annoty/app/core/constants/misc/key.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/pdf_reader_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends GetView<AnnotyReaderController> {
  const PdfViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return SfPdfViewer.file(
      controller.pdfFile,
      key: KeyConst.pdfKey,
      controller: controller.pdfViewerController,
      enableTextSelection: true,
      onTextSelectionChanged: (PdfTextSelectionChangedDetails details) {
        print("details.globalSelectedRegion:  ${details.globalSelectedRegion}");
        if (details.selectedText == null &&
            controller.contextMenu.selectionOverlayEntry != null) {
          controller.pdfViewerController.clearSelection();
          controller.contextMenu.handleContextMenuClose();
        } else if (details.selectedText != null &&
            controller.contextMenu.selectionOverlayEntry == null) {
          controller.contextMenu
              .showContextMenu(context: context, details: details);
        }
      },
    );
  }
}
