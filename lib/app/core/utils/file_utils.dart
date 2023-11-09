import 'package:path/path.dart' as p;

// Todo implement in all repeated area
// Todo add resource file model tree functions here
class FileUtils {
  static getFilename(String path) => p.basename(path);
  static getFileNameWithoutExt(String path) => p.basenameWithoutExtension(path);
  static getFileExt(String path) => p.extension(path);
  static getFolderName(String path) => p.basename(p.dirname(path));
  static getFolderPath(String path) => p.dirname(path);
}
