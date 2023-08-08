import 'dart:io';

import 'package:annoty/app/core/controllers/pdf_directory_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  final PdfDirectoryController pdfDirCtrl = Get.find<PdfDirectoryController>();
  List<FileSystemEntity> get pdfDirEntityList => pdfDirCtrl.fentities;
  int get pdfDirEntityListSize => pdfDirEntityList.length;

}