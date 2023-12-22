import 'dart:io';

import 'package:annoty/app/core/constants/database/resource_file_tree.dart';
import 'package:path_provider/path_provider.dart';

class AppFileService {
  final String documentName;
  final String documentType;

  late Directory location;
  late Directory home;
  late Directory document;
  late List<FileSystemEntity> children;

  static AppFileService? instance;

  AppFileService({required this.documentName, required this.documentType});
  
  Future<AppFileService> init() async {
    location = await getApplicationDocumentsDirectory();
    await _ensureHomeInitialization();
    await _ensureDocumentInitialization();
    children = await document.list().toList();
    return instance ??
        (instance =
            AppFileService(documentName: "Resources", documentType: "pdf"));
  }

  Future<void> _ensureDocumentInitialization() async {
    document = Directory("${home.path}\\$documentName");
    if (!await document.exists()) await document.create();
  }

  Future<void> _ensureHomeInitialization() async {
    home = Directory("${location.path}\\${ResourceFolderTreeConst.main}");
    if (!await home.exists()) await home.create();
  }

  Future makeFolder({required String name, required Directory parent}) async {
    int i = 0;
    i++;
    String location = "${parent.path}\\$name";
    Directory folder = Directory(location);
    if (await folder.exists()) makeFolder(name: "$name+$i", parent: parent);
    folder.create();
    return true;
  }

  Future makeFile({required String name, required Directory parent}) async {}
  Future copyFile({required String path, required File file}) async =>
      await file.copy("$path\\${file.path.split("\\").last}");
  // TODO: Future copyFolder({required String path, required Directory folder}){}
  Future<Directory> updateFolder({required String name, required Directory folder}) =>
      folder.rename("${folder.parent.path}\\$name");
  Future<File> updateFile({required String name, required File file}) =>
      file.rename("${file.parent.path}\\$name.pdf");
}
