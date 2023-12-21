import 'package:annoty/app/core/routes/home_routes.dart';
import 'package:get/get.dart';

class UnknownController extends GetxController {

  @override
  void onReady() {
    super.onReady();
    const Duration(seconds: 5);
    Get.offNamed(HomeRoutes.home);
  }
}
