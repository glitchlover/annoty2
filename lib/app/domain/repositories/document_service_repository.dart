import 'dart:io';

import 'package:annoty/app/core/constants/database/resource_file_tree.dart';
import 'package:path_provider/path_provider.dart';

class AppFileServices {
  final String documentName;
  final String documentType;
  static AppFileServices? instance;

  static Future<AppFileServices> int(
      {required documentName, required documentType}) async {
    return instance ??
        (instance =
            AppFileServices(documentName: "Resources", documentType: "pdf"));
  }

  AppFileServices({required this.documentName, required this.documentType});

  Future<Directory> get home async => await getApplicationDocumentsDirectory();
  Future<Directory> get main async {
    Directory directory =
        Directory("${(await home).path}\\${ResourceFolderTreeConst.main}");
    if (await directory.exists()) return directory;
    return directory.create();
  }

  Future<List<FileSystemEntity>> get children async =>
      await (await document).list().toList();
  Future<Directory> get document async =>
      Directory("${(await main).path}\\$documentName");

  // Future makeFolder({required String name, required Directory parent}){}
  // Future makeFile({required String name, required Directory parent}){}
  // Future copyFile({required String path, required File file}){}
  // Future copyFolder({required String path, required Directory folder}){}
  // Directory updateFolderName({required String name, required Directory folder}){}
  // Directory updateFileName({required String name, required File file}){}
}
