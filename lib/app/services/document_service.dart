import 'dart:async';
import 'dart:io';
import 'package:annoty/app/core/constants/database/db.dart';
import 'package:path_provider/path_provider.dart';

class DocumentServices {
  final String masterFolderName = DBconst.main;
  late Directory masterFolder;
  final String dbFolderName;
  late Directory dbFolder;
  final String dbType;
  late String _localPath;
  late List<FileSystemEntity> entities;

  //........................___constructor___........................
  DocumentServices({required this.dbFolderName, required this.dbType}) {
    setLocaPath();
    Timer(const Duration(milliseconds: 1000), () {
      makeMasterDbFolder();
      makeDbFolder();
      initDbEntities();
    });
  }
  //........................___making files and folder___........................
  setLocaPath() async {
    final directory = await getApplicationDocumentsDirectory();
    _localPath = directory.path;
  }

  void makeMasterDbFolder() async {
    masterFolder = Directory("$_localPath\\$masterFolderName");
    if (await masterFolder.exists()) return;
    masterFolder.create();
  }

  void makeDbFolder() async {
    dbFolder = Directory("$_localPath\\$masterFolderName\\$dbFolderName");
    print("makeDbFolder:${dbFolder.path}");
    if (await dbFolder.exists()) return;
    await dbFolder.create();
  }

  //......................initialize entities of dbFolderName ....................
  void initDbEntities() async {
    entities = await dbFolder.list().toList();
  }

  // ........................creating files and folders.....................
  Future<bool> mkFolder(String name, Directory parent) async {
    int i = 0;
    i++;
    String location = "${parent.path}\\$name";
    Directory folder = Directory(location);
    if (await folder.exists()) mkFolder("$name+$i", parent);
    folder.create();
    return true;
  }

  void mkFile(String name, Directory parent) async {
    int i = 0;
    i++;
    String location = "${parent.path}\\$name.$dbType";
    File file = File(location);
    if (await file.exists()) mkFile("$name$i.$dbType", parent);
    file.create();
  }

  // ....................Copying files and folders................
  void copyFile(String path, File file) {
    file.copy("$path\\${file.path.split("\\").last}");
  }

  void updateFolder(String name, Directory thisDir) {
    String newPath = "${thisDir.parent.path}\\$name";
    thisDir.rename(newPath);
  }

  void updateFile(String name, File thisDir) {
    String newPath = "${thisDir.parent.path}\\$name.$dbFolderName";
    thisDir.rename(newPath);
  }

  // ..................deleting files and folders ................

  static void deltFile(String path) {
    File(path).delete();
  }

  static void deltFolder(String path) {
    Directory(path).delete(recursive: true);
  }
  // ...................get children files and folders ..................

  List<FileSystemEntity> getChildren(
      {required Directory directory,
      required int currentDepth,
      int? targetDepth}) {
    List<FileSystemEntity> result = [];

    if (targetDepth == null || currentDepth < targetDepth) {
      if (directory.existsSync()) {
        for (var entity in directory.listSync()) {
          result.add(entity);

          if (entity is Directory) {
            result.addAll(getChildren(
                directory: entity,
                currentDepth: currentDepth + 1,
                targetDepth: targetDepth));
          }
        }
      }
    }

    return result;
  }

  List<FileSystemEntity> getChildrenFolder(
      {required Directory directory,
      required int currentDepth,
      int? targetDepth}) {
    List<Directory> result = [];

    if (targetDepth == null || currentDepth < targetDepth) {
      if (directory.existsSync()) {
        for (var entity in directory.listSync()) {
          if (entity is Directory) {
            result.add(entity);
            result.addAll(getChildrenFolder(
                directory: entity,
                currentDepth: currentDepth + 1,
                targetDepth: targetDepth) as Iterable<Directory>);
          }
        }
      }
    }

    return result;
  }

  List<FileSystemEntity> getChildrenFile(
      {required Directory directory,
      required int currentDepth,
      int? targetDepth}) {
    List<File> result = [];

    if (targetDepth == null || currentDepth < targetDepth) {
      if (directory.existsSync()) {
        for (var entity in directory.listSync()) {
          if (entity is File) {
            result.add(entity);
          } else if (entity is Directory) {
            result.addAll(getChildrenFile(
                directory: entity,
                currentDepth: currentDepth + 1,
                targetDepth: targetDepth) as Iterable<File>);
          }
        }
      }
    }

    return result;
  }
}
