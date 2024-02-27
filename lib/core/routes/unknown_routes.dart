import 'package:get/get.dart';
import 'package:annoty/app/presentation/pages/unknown/unknown_binding.dart';
import 'package:annoty/app/presentation/pages/unknown/unknown_page.dart';


class UnknownRoutes {
  UnknownRoutes._();

  static const unknown = '/unknown';

  static final routes = [
    GetPage(
      name: unknown,
      page: () => const UnknownPage(),
      binding: UnknownBinding(),
    ),
  ];
}
