import 'dart:io';

import 'package:annoty/core/constants/misc/objects.dart';
import 'package:path/path.dart' as p;

// Todo implement in all repeated area
// Todo add resource file model tree functions here
class FileUtils {
  static String getEntityName(String path) => p.basename(path);
  static String getFileNameWithoutExt(String path) =>
      p.basenameWithoutExtension(path);
  static String getFileExt(String path) => p.extension(path);
  static String getFolderName(String path) => p.basename(p.dirname(path));
  static String getFolderPath(String path) => p.dirname(path);
  static Directory getFolderFromFile(File file) =>
      Directory(p.dirname(file.path));
  static File getResourceFileFromFolder(Directory dir) =>
      File("${dir.path}\\${getEntityName(dir.path)}.pdf");
  static Directory getResourceFolderFromName(String name) =>
      Directory("${kAppFileService.workingDirectory["Resource"]!.path}\\name");
}
