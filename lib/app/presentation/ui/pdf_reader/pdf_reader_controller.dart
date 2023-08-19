import 'dart:io';

import 'package:get/get.dart';

class PdfReaderController extends GetxController {
  late final File pdfFile;

  @override
  void onInit() {
    pdfFile = Get.arguments;
    print(pdfFile);
    super.onInit();
  }
}
