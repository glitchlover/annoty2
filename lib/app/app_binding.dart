import 'package:annoty/app/presentation/shared/controllers/resource_directory_system_controller.dart';
import 'package:annoty/app/presentation/shared/controllers/theme_toggle_controller.dart';
import 'package:annoty/app/presentation/ui/splash_screen/splash_screen_controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController(),);
    Get.put(ThemeToggleController());
    Get.put(ResourceDirectorySystemController());
  }
}