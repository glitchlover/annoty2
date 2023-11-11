import 'package:annoty/app/core/constants/misc/key.dart';
import 'package:annoty/app/core/constants/misc/objects.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ToolBoxMenuController extends GetxController {
  // final TapRegionCallback? onTap;
  // final Color? color;
  // final Color? disableColor;
  // final Color? textColor;
  // final Color? panFillColor;
  // final Color? chooseFileFillColor;
  // final Color? zoomFillColor;
  // final Color? serchFillColor;
  // final Color? settingsFillColor;
  final int pageCount = 0;
  final double zoomLevel = 1;
  final GlobalKey searchKey = GlobalKey();
  final GlobalKey zoomPercentageKey = GlobalKey();
  final GlobalKey settingsKey = GlobalKey();
  final GlobalKey focusNode = GlobalKey();
  final bool isWeb = false;
  final bool showTooltip = true;
  final PdfViewerController pdfViewerController =
      ConstObject().pdfViewerController;
  final SfPdfViewerState? currentPdfViewerState = ConstKey.pdfKey.currentState;

  toggleBookmark() {
    !currentPdfViewerState!.isBookmarkViewOpen
        ? currentPdfViewerState?.openBookmarkView()
        : Navigator.pop(Get.context!);
  }
    // Todo move to annotation widget
}
