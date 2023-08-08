import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'unknown_controller.dart';

class UnknownPage extends GetView<UnknownController> {
  const UnknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    (Get.put(UnknownController()));
    return Scaffold(body: Container());
  }
}
