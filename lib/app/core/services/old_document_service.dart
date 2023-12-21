import 'dart:async';
import 'dart:io';
import 'package:annoty/app/core/constants/database/resource_file_tree.dart';
import 'package:annoty/app/core/resources/logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class DocumentServices {
  final String mainFolderName = ResourceFolderTreeConst.main;
  late Directory mainFolder;
  final String documentFolderName;
  late Directory documentFolder;
  final String documentType;
  late String _homePath;
  late List<FileSystemEntity> entities;//todo

  //........................___constructor___........................
  //todo - change it to asynchronous factory and singleton constructor
  DocumentServices({required this.documentFolderName, required this.documentType}) {
    setLocaPath();
    Timer(const Duration(milliseconds: 1000), () {
      makeMasterDbFolder();
      makeDbFolder();
      initDbEntities();
    });
  }
  //........................___making files and folder___........................
  // todo - all this goes to file utils
  setLocaPath() async {
    final directory = await getApplicationDocumentsDirectory();
    _homePath = directory.path;
  }

  void makeMasterDbFolder() async {
    mainFolder = Directory("$_homePath\\$mainFolderName");
    if (await mainFolder.exists()) return;
    mainFolder.create();
  }

  void makeDbFolder() async {
    documentFolder = Directory("$_homePath\\$mainFolderName\\$documentFolderName");
    Flog.debug(documentFolder.path);
    if (await documentFolder.exists()) return;
    await documentFolder.create();
  }

  //......................initialize entities of documentFolderName ....................
  void initDbEntities() async {
    entities = await documentFolder.list().toList();
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
    String location = "${parent.path}\\$name. documentType";
    File file = File(location);
    if (await file.exists()) mkFile("$name$i. documentType", parent);
    file.create();
  }

  // ....................Copying files and folders................
  Future copyFile(String path, File file) async =>
    await file.copy("$path\\${file.path.split("\\").last}");

  Directory updateFolder(String name, Directory thisDir){
    String newPath = "${thisDir.parent.path}\\$name";
    return thisDir.renameSync(newPath);
  }

  Future updateFile(String name, File thisDir) async{
    String newPath = "${thisDir.parent.path}\\$name. documentFolderName";
    await thisDir.rename(newPath);
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
