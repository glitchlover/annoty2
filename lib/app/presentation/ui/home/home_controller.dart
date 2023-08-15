import 'dart:io';

import 'package:annoty/app/core/controllers/pdf_directory_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final PdfDirectoryController pdfDirCtrl = Get.find<PdfDirectoryController>();
  RxList<Directory> get pdfDirEntityList =>
      pdfDirCtrl.pdfService.getChildrenFolder(
          directory: pdfDirCtrl.pdfService.dbFolder, currentDepth: 1).obs;
  Rx<int> get pdfDirEntityListSize => pdfDirEntityList.length.obs;
}
