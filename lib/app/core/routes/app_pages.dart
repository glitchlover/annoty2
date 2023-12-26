import 'package:get/route_manager.dart';
import 'home_routes.dart';
import 'splash_screen_routes.dart';
import 'pdf_reader_routes.dart';
import 'unknown_routes.dart';

class AppPages {
  AppPages._();

  static const initial = SplashScreenRoutes.splashScreen;

  static final List<GetPage> routes = [
    ...SplashScreenRoutes.routes,
    ...HomeRoutes.routes,
    ...PdfReaderRoutes.routes,
		...UnknownRoutes.routes,
  ];
}
