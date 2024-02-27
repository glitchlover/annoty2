
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:annoty/app/database/repositories/theme_service.dart';
import 'package:annoty/core/routes/app_pages.dart';
import 'package:annoty/core/routes/splash_screen_routes.dart';
import 'package:annoty/core/services/app_binding.dart';
import 'package:annoty/core/theme/my_theme_data.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Annoty',
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightthemeData,
      darkTheme: MyThemeData.darkthemeData,
      themeMode: ThemeService.instance.themeMode,
      initialBinding: AppBindings(),
      initialRoute: SplashScreenRoutes.splashScreen,
      getPages: AppPages.routes,
    );
  }
}
