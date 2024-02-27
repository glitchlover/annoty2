import 'package:get/get.dart';
import 'package:annoty/app/presentation/pages/splash_screen/splash_screen_binding.dart';
import 'package:annoty/app/presentation/pages/splash_screen/splash_screen_page.dart';


class SplashScreenRoutes {
  SplashScreenRoutes._();

  static const splashScreen = '/';

  static final routes = [
    GetPage(
      name: splashScreen,
      page: () => const SplashScreenPage(),
      binding: SplashScreenBinding(),
    ),
  ];
}
