
import 'package:annoty/app/app_binding.dart';
import 'package:annoty/app/core/routes/app_pages.dart';
import 'package:annoty/app/core/routes/splash_screen_routes.dart';
import 'package:annoty/app/core/theme/my_theme_data.dart';
import 'package:annoty/app/domain/providers/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Annoty',
      theme: MyThemeData.lightthemeData,
      darkTheme: MyThemeData.darkthemeData,
      themeMode: ThemeService.instance.themeMode,
      initialBinding: AppBindings(),
      initialRoute: SplashScreenRoutes.splashScreen,
      getPages: AppPages.routes,
    );
  }
}
