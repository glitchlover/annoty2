import 'package:annoty/app/core/routes/pdf_reader_routes.dart';

import 'home_routes.dart';
import 'splash_screen_routes.dart';
import 'unknown_routes.dart';

class AppPages {
  AppPages._();

  static const initial = SplashScreenRoutes.splashScreen;

  static final routes = [
    ...HomeRoutes.routes,
    ...SplashScreenRoutes.routes,
		...UnknownRoutes.routes,
    ...PdfReaderRoutes.routes,
  ];
}
