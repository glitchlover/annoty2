import 'dart:io';

import 'package:annoty/app/core/constants/database/resource_file_tree.dart';
import 'package:path_provider/path_provider.dart';

class AppFileServices {
  final String documentName;
  final String documentType;
  static AppFileServices? instance;

  Future<Directory> get location async =>
      await getApplicationDocumentsDirectory();
  Future<Directory> get home async {
    Directory directory =
        Directory("${(await location).path}\\${ResourceFolderTreeConst.main}");
    if (await directory.exists()) return directory;
    return directory.create();
  }

  Future<Directory> get document async =>
      Directory("${(await home).path}\\$documentName");
  Future<List<FileSystemEntity>> get children async =>
      await (await document).list().toList();

  AppFileServices({required this.documentName, required this.documentType});

  Future<AppFileServices> init() async {
    if (!await (await home).exists()) (await home).create();
    if (!await (await document).exists()) (await document).create();
    return instance ??
        (instance =
            AppFileServices(documentName: "Resources", documentType: "pdf"));
  }
  // Future makeFolder({required String name, required Directory parent}){}
  // Future makeFile({required String name, required Directory parent}){}
  // Future copyFile({required String path, required File file}){}
  // Future copyFolder({required String path, required Directory folder}){}
  // Directory updateFolderName({required String name, required Directory folder}){}
  // Directory updateFileName({required String name, required File file}){}
}
