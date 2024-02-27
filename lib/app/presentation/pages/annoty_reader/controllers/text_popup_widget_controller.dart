part of annoty_controller;

class TextPopUpWidgetController extends GetxController {
  late Rx<OverlayEntry> textPopUpEntry;
  bool textPopUpMounted = false;
  Color? contextMenuColor = ConstColorMain.primaryBGDark;
  Color? copyTextColor = ConstColorMain.primaryBGDark;
  late BuildContext context;

  @override
  onInit() {
    textPopUpEntry = OverlayEntry(builder: (_) => Container()).obs;
    super.onInit();
  }

  void checkAndClosePopUpEntry(PdfViewerController controller) {
    if (textPopUpMounted) {
      textPopUpEntry.value.remove();
      textPopUpEntry.value.dispose();
      textPopUpMounted = false;
      textPopUpEntry.refresh();
      controller.clearSelection();
    }
  }

  void renderTextPopUp(
      {required BuildContext context,
      required PdfTextSelectionChangedDetails details}) {
    this.context = context;
    textPopUpEntry.value = createOverlayEntryAsTextPopUpWidget(details);
    Overlay.of(context, rootOverlay: true).insert(textPopUpEntry.value);
    textPopUpMounted = true;
  }

  OverlayEntry createOverlayEntryAsTextPopUpWidget(
      PdfTextSelectionChangedDetails details) {
    // Flog.mark("");
    final List<BoxShadow> boxShadow = ConstUiMisc().shadow;
    final (top, left) = getPosition(details);

    return OverlayEntry(
      builder: (BuildContext context) => Positioned(
        top: top,
        left: left,
        child: Container(
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: contextMenuColor,
            boxShadow: boxShadow,
          ),
          constraints: BoxConstraints(
              maxWidth: ConstSizing.size_4_1 * 100,
              maxHeight: ConstSizing.size_4_1 * 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              PopUpWidgetButton(
                  details: details,
                  color: ConstColorHighlight.orange),
              PopUpWidgetButton(
                  details: details,
                  color: ConstColorHighlight.green),
              PopUpWidgetButton(
                  details: details,
                  color: ConstColorHighlight.blue),
              PopUpWidgetButton(
                  details: details,
                  color: ConstColorHighlight.purple),
              PopUpWidgetButton(
                  details: details,
                  color: ConstColorHighlight.red),
            ],
          ),
        ),
      ),
    );
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

class PopUpWidgetButton extends StatelessWidget {
  const PopUpWidgetButton({
    Key? key,
    required this.details,
    required this.color,
  }) : super(key: key);

  final PdfTextSelectionChangedDetails details;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          minimumSize: const Size(10.0, 35.0),
          padding: EdgeInsets.all(ConstSizing.size_4_1)),
      child: Icon(
        Icons.circle,
        color: color,
        size: 20,
      ),
      onPressed: () async {
        await kcAnnotation.addAnnotationToPdf(
            annotyReaderController: kcAnnotyStudyEngine,
            details: details,
            color: color);
      },
    );
  }
}
