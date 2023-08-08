import 'package:get/get.dart';
import 'package:annoty/app/presentation/ui/splash_screen/splash_screen_binding.dart';
import 'package:annoty/app/presentation/ui/splash_screen/splash_screen_page.dart';


class SplashScreenRoutes {
  SplashScreenRoutes._();

  static const splashScreen = '/splash-screen';

  static final routes = [
    GetPage(
      name: splashScreen,
      page: () => const SplashScreenPage(),
      binding: SplashScreenBinding(),
    ),
  ];
}
