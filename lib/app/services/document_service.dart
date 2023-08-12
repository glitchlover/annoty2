import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DocumentServices {
  final String masterDb = "annotyDb";
  final String db;
  late Directory masterDbFolder;
  late String _localPath;
  late Directory dbFolder;
  late List<FileSystemEntity> entities;

  //........................___constructor___........................
  DocumentServices({required this.db}) {
    setLocaPath();
    Timer(const Duration(milliseconds: 1000), () {
      makeMasterDbFolder();
      makeDbFile();
      initDbEntities();
    });
  }

  //........................___making files and folder___........................
  setLocaPath() async {
    final directory = await getApplicationDocumentsDirectory();
    _localPath = directory.path;
  }

  void makeMasterDbFolder() async {
    masterDbFolder = Directory("$_localPath\\$masterDb");
    if (await masterDbFolder.exists()) return;
    masterDbFolder.create();
  }

  void makeDbFile() async {
    dbFolder = Directory("$_localPath\\$masterDb\\$db");
    print("makeDbFolder:${dbFolder.path}");
    if (await dbFolder.exists()) return;
    await dbFolder.create();
  }

  //......................initialize entities of db ....................
  Future<List<FileSystemEntity>> initDbEntities() async{
    entities = await dbFolder.list().toList();
    return entities
;
  }

  // ........................creating files and folders.....................
  static void mkFolder(String name, Directory parent) async {
    int i = 0;
    i++;
    String location = "${parent.path}\\$name";
    Directory folder = Directory(location);
    if (await folder.exists()) mkFolder("$name+$i", parent);
    folder.create();
  }

  void mkFile(String name, Directory parent) async {
    int i = 0;
    i++;
    String location = "${parent.path}\\$name.$db";
    File file = File(location);
    if (await file.exists()) mkFile("$name$i.$db", parent);
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
    String newPath = "${thisDir.parent.path}\\$name.$db";
    thisDir.rename(newPath);
  }

  // ..................deleting files and folders ................

  static void deltFile(String path) {
    File(path).delete();
  }

  static void deltFolder(String path) {
    Directory(path).delete(recursive: true);
  }
}