import 'package:annoty/app/core/resources/logger/logger.dart';
import 'package:annoty/app/database/sources/local/objectbox.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'app/app.dart';

void main() async {
  Flog.init();
  await GetStorage.init();
  await ObjectBoxDB.init();
  // await DocumentServices(
  //         documentFolderName: ResourceFolderTreeConst.main,
  //         documentType: "pdf"
  //     ).init();
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding.instance.waitUntilFirstFrameRasterized;
  runApp(const App());  
}