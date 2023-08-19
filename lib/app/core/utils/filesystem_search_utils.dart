import 'dart:io';
import 'dart:async';

class FileSystemSearchUtils {
  Future<FileSystemEntity?> findFileOrFolder(Directory directory, String name,
      {String? extension, bool searchFolders = true}) async {
    if (!await directory.exists()) {
      return null;
    }

    Completer<FileSystemEntity?> completer = Completer<FileSystemEntity?>();

    StreamSubscription<FileSystemEntity> subscription =
        directory.list(recursive: true).listen((entity) {
      if (entity is File) {
        if (extension != null && extension.isNotEmpty) {
          if (entity.path.endsWith(extension) && entity.path.contains(name)) {
            completer.complete(entity);
          }
        }
      } else if (entity is Directory && searchFolders) {
        if (entity.path.contains(name)) {
          completer.complete(entity);
        }
      }
    }, onDone: () {
      completer.complete(null); // Entity not found
    });

    return completer.future.whenComplete(() {
      subscription.cancel();
    });
  }
}
