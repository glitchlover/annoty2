import 'package:annoty/app/core/constants/ui/assets.dart';
import 'package:annoty/app/presentation/ui/home/home_page.dart';
import 'package:annoty/app/presentation/ui/unknown/unknown_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbib_splash_screen/splash_screen.dart';

import 'splash_screen_controller.dart';

class SplashScreenPage extends GetView<SplashScreenController> {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SplashScreenView(
      imageSrc: Assets.kAstImgIcon, //todo - loti animation
      navigateRoute: UnknownPage(),
      duration: Duration(seconds: 3),
    );
  }
}
