import 'package:annoty/app/core/constants/ui/assets.dart';
import 'package:annoty/app/core/controllers/theme_controller.dart';
import 'package:annoty/app/presentation/shared/widget/my_app_bar.dart';
import 'package:annoty/app/presentation/shared/widget/my_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBar {
  AppBar myHomeAppBar() {
    ThemeToggleController thmCtrl = Get.find<ThemeToggleController>();
    return MyAppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(Assets.kAstImgIcon),
        ),
        actions: [
          Obx(() {
            return MyIconButton(
                onPressed: () {
                  thmCtrl.toggle();
                },
                icon: Icon(thmCtrl.icon.value));
          })
        ]).paint();
  }
}
