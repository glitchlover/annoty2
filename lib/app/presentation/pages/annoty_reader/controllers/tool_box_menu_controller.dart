part of annoty_controller;

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
  final PdfViewerController pdfViewerController = kpdfViewerController;
  final SfPdfViewerState? currentPdfViewerState = ConstKey.pdfKey.currentState;

  toggleBookmark() {
    !currentPdfViewerState!.isBookmarkViewOpen
        ? currentPdfViewerState?.openBookmarkView()
        : Navigator.pop(Get.context!);
  }
  // Todo move to annotation widget
}
