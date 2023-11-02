import 'package:annoty/app/core/logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'app/app.dart';

void main() async {
  Flog.init();
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding.instance.waitUntilFirstFrameRasterized;
  await GetStorage.init();
  runApp(const App());
}