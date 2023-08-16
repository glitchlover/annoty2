import 'package:annoty/app/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ThemeToggleController extends GetxController {
  ThemeService get service => ThemeService.instance;
  ThemeMode get mode => ThemeService.instance.themeMode;
  Rx<IconData> icon = Icons.add.obs;

  @override
  void onInit() {
    setIcon(mode);
    update();
    super.onInit();
  }

  setIcon(mode) {
    icon.value = (mode == ThemeMode.dark) ? Icons.wb_sunny_outlined : Icons.circle_rounded;
    update();
  }

  toggle() {
    if (mode == ThemeMode.dark) {
      service.themeMode = ThemeMode.light;
    } else {
      service.themeMode = ThemeMode.dark;
    }
    setIcon(mode);
    update();
  }
}
