import 'package:annoty/app/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ThemeToggleController extends GetxController {
  ThemeService get service => ThemeService.instance;
  ThemeMode get mode => ThemeService.instance.themeMode;
  Rx<IconData> icon = Iconsax.add.obs;

  @override
  void onInit() {
    setIcon(mode);
    update();
    super.onInit();
  }

  setIcon(mode) {
    icon.value = (mode == ThemeMode.dark) ? Iconsax.sun : Iconsax.moon;
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
