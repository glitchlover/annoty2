import 'package:annoty/app/database/apis/theme_service.dart';
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
    icon.value = (mode == ThemeMode.dark) ? Icons.light_mode_outlined : Icons.dark_mode_outlined;
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
