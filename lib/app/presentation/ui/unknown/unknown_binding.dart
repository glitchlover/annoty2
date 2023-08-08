import 'package:get/get.dart';

import 'unknown_controller.dart';

class UnknownBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UnknownController());
  }
}
