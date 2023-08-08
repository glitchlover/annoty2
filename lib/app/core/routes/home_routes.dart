import 'package:get/get.dart';
import 'package:annoty/app/presentation/ui/home/home_binding.dart';
import 'package:annoty/app/presentation/ui/home/home_page.dart';

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
