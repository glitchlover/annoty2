import 'package:annoty/app/core/constants/color/core.dart';
import 'package:annoty/app/core/constants/ui/assets.dart';
import 'package:annoty/app/core/controllers/theme_controller.dart';
import 'package:annoty/app/core/theme/my_text.dart';
import 'package:annoty/app/presentation/shared/widget/my_app_bar.dart';
import 'package:annoty/app/presentation/shared/widget/my_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBar {
  AppBar paint() {
    ThemeToggleController thmCtrl = Get.find<ThemeToggleController>();
    return MyAppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(Assets.kAstImgIcon),
        ),
        title: const MyText("Annoty").heading1(),
        actions: [
          Obx(() {
            return MyIconButton(
              onPressed: () {
                thmCtrl.toggle();
              },
              icon: Icon(thmCtrl.icon.value),
              color: MyCoreColor.yellow
            );
          }),
          MyIconButton(onPressed: (){}, icon: const Icon(Icons.notifications_outlined, color: MyCoreColor.orange)),
          MyIconButton(onPressed: (){}, icon: const Icon(Icons.face_outlined, color: MyCoreColor.green))
        ]);
  }
}
