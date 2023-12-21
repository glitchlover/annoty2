import 'package:permission_handler/permission_handler.dart';

class PermissionRequestHandler {
  
  Future requestPermissions({required dynamic perform}) async {
    Map<Permission, PermissionStatus> status = await [
      Permission.storage, // For both read and write permissions
    ].request();

    if (status[Permission.storage] == PermissionStatus.granted) {
      // Flog.info(status[Permission.storage]);
      perform;
      return;
    } else {
      // Flog.error(status[Permission.storage]);
    }
  }
}
