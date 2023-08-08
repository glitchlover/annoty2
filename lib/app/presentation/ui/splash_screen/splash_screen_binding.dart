import 'package:annoty/app/core/controllers/pdf_directory_controller.dart';
import 'package:annoty/app/core/controllers/theme_controller.dart';
import 'package:get/get.dart';

import 'splash_screen_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController(),);
    Get.put(ThemeToggleController());
    Get.put(PdfDirectoryController());
  }
}
