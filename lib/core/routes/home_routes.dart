import 'package:get/get.dart';
import 'package:annoty/app/presentation/pages/home/home.dart';

class HomeRoutes {
  HomeRoutes._();

  static const home = '/home';

  static final routes = [
    GetPage(
      name: home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
