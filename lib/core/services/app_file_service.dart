// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:io';

import 'package:annoty/core/utils/file_utils.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';

class AppFileService {
  late String _indexName;
  late Directory _location;
  late Directory index;
  Map<String, Directory> workingDirectory = <String, Directory>{};
  Future<List<FileSystemEntity>> getSubEntity({required Directory folder}) =>
      folder.list().toList();
  Future<List<Directory>> getSubdirectories({required Directory folder}) async {
    final list = folder.listSync();

    return list
        .map((entity) {
          if (entity is Directory) {
            return entity;
          }
          return null;
        })
        .where((entity) => entity != null)
        .cast<Directory>()
        .toList();
  }

  Future<List<File>> getSubFiles({required Directory folder}) async {
    final list = folder.listSync();

    return list
        .map((entity) {
          if (entity is File) {
            return entity;
          }
          return null;
        })
        .where((entity) => entity != null)
        .cast<File>()
        .toList();
  }

  static AppFileService? instance;

  Future<AppFileService> init() async {
    _indexName = (await PackageInfo.fromPlatform()).appName;
    _location = await getApplicationDocumentsDirectory();
    await _ensureIndexDirecotoryInitialization();
    await _ensureWorkingDirectoryInitialization();
    return instance ?? (instance = AppFileService());
  }

  Future<void> _ensureWorkingDirectoryInitialization() async =>
      (await getSubdirectories(folder: index)).forEach(
          (e) => workingDirectory.addAll({FileUtils.getEntityName(e.path): e}));

  Future<void> _ensureIndexDirecotoryInitialization() async {
    index = Directory("${_location.path}\\$_indexName");
    if (!await index.exists()) await index.create();
  }

  Future<void> initializingWorkingDirectory({required String name}) async {
    if (workingDirectory.containsKey(name)) return;
    await makeFolder(name: name, parent: index);
    workingDirectory.addAll({name: Directory("${index.path}\\$name")});
  }

  Future<Directory> makeFolder(
      {required String name, required Directory parent}) async {
    int i = 0;
    i++;
    String location = "${parent.path}\\$name";
    Directory folder = Directory(location);
    if (await folder.exists()) makeFolder(name: "$name+$i", parent: parent);
    folder.create();
    return folder;
  }

  Future makeFile({required String name, required Directory parent}) async {}
  Future<File> copyFile({required String path, required File file}) async =>
      await file.copy("$path\\${file.path.split("\\").last}");
  // TODO: Future copyFolder({required String path, required Directory folder}){}
  Future<Directory> updateFolder(
          {required String name, required Directory folder}) =>
      folder.rename("${folder.parent.path}\\$name");
  Future<File> updateFile({required String name, required File file}) =>
      file.rename("${file.parent.path}\\$name.pdf");
}
