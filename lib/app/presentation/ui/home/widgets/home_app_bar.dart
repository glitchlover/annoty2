import 'package:annoty/app/core/constants/color/core.dart';
import 'package:annoty/app/core/constants/ui/assets.dart';
import 'package:annoty/app/core/constants/ui/sizing.dart';
import 'package:annoty/app/presentation/shared/controllers/theme_toggle_controller.dart';
import 'package:annoty/app/core/theme/my_text.dart';
import 'package:annoty/app/core/theme/my_text_theme.dart';
import 'package:annoty/app/presentation/shared/widget/my_app_bar.dart';
import 'package:annoty/app/presentation/shared/widget/my_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBar {
  AppBar paint() {
    ThemeToggleController thmCtrl = Get.find<ThemeToggleController>();
    return MyAppBar(
        leading: const Leading(),
        title: const TitleWidget(),
        actions: myIconActions(thmCtrl));
  }

  List<Widget> myIconActions(ThemeToggleController thmCtrl) {
    return [
        Obx(() {
          return MyIconButton(
              onPressed: () {
                thmCtrl.toggle();
              },
              icon: Icon(thmCtrl.icon.value),
              color: MyCoreColor.yellow);
        }),
        MyIconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined,
            color: MyCoreColor.orange)),
        MyIconButton(
            onPressed: () {},
            icon: const Icon(Icons.face_outlined, color: MyCoreColor.green))
      ];
  }
}




class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MyText("Annoty").temp(MyTextTheme(
                color: MyCoreColor.accent, fontFace: "Quicksand Bold")
            .titleLarge);
  }
}


class Leading extends StatelessWidget {
  const Leading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SpaceSizing.mainPadding),
      child: Image.asset(Assets.kAstImgIcon),
    );
  }
}
