library annoty_controller;

import 'dart:io';

import 'package:annoty/core/constants/color/core.dart';
import 'package:annoty/core/constants/color/highlights.dart';
import 'package:annoty/core/constants/misc/controllers.dart';
import 'package:annoty/core/constants/misc/key.dart';
import 'package:annoty/core/constants/misc/objects.dart';
import 'package:annoty/core/constants/ui/sizing.dart';
import 'package:annoty/core/constants/ui/ui_element.dart';
import 'package:annoty/core/utils/file_utils.dart';
import 'package:annoty/app/database/models/annotation.dart';
import 'package:annoty/app/database/repositories/local/annotation_repository.dart';
import 'package:annoty/app/domain/usecases/annotation_usecase.dart';
import 'package:annoty/app/presentation/shared/controllers/permission_request_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

part "annotation_bar_controller.dart";
part "annotation_card_controller.dart";
part "annotation_controller.dart";
part "text_popup_widget_controller.dart";
part "tool_box_menu_controller.dart";

class AnnotyStudyEngineController extends GetxController {
  final Rx<PdfTextSelectionChangedDetails> lastDetails =
      PdfTextSelectionChangedDetails(null, null).obs;
  final PdfViewerController pdfViewerController = kpdfViewerController;
  final TextPopUpWidgetController popUpWidgetController =
      Get.find<TextPopUpWidgetController>();
  late final File pdfFile;
  final Rx<Uint8List> pdfBytes = Rx(Get.arguments);

  //Add all the annotation collection get variable function

  @override
  void onInit() {
    pdfBytes.value = Get.arguments;
    pdfFile = File(Get.parameters["pdfFile"]!);
    super.onInit();
  }

  @override
  void onClose() async {
    popUpWidgetController.checkAndClosePopUpEntry(pdfViewerController);
    await PermissionRequestHandler().requestPermissions(
        perform: await pdfFile.writeAsBytes(pdfBytes.value));
    super.onClose();
  }

  void handleTextPopUpWidget(
      PdfTextSelectionChangedDetails details, BuildContext context) {
    if (details == lastDetails.value) return;
    if (details.selectedText == null &&
        popUpWidgetController.textPopUpMounted == true) {
      popUpWidgetController.checkAndClosePopUpEntry(pdfViewerController);
    } else if (details.selectedText != null &&
        popUpWidgetController.textPopUpMounted == false) {
      popUpWidgetController.renderTextPopUp(context: context, details: details);
    }
    lastDetails.value = details;
    lastDetails.refresh();
  }

  void onDocumentLoaded() {
    //Todo see if the file is modified or opened for the first time.
    jumpToPreviousOffset();
  }

  void jumpToPreviousOffset() {
    AnnotationController annotationController =
        Get.find<AnnotationController>();
    pdfViewerController.jumpTo(
        xOffset: annotationController.scrollOffset.value.dx,
        yOffset: annotationController.scrollOffset.value.dy);
  }
}
