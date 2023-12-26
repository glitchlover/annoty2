import 'dart:io';
import 'package:annoty/app/core/utils/file_utils.dart';
import 'package:annoty/app/database/repositories/local/resource_repository.dart';
import 'package:annoty/app/presentation/shared/controllers/permission_request_handler.dart';

class ResourceUsecase {
  Future add({required File file}) async =>
      await LocalResourceRepository().saveResourceModel(file.path);

  Future delete({required File file}) async {
    await PermissionRequestHandler()
        .requestPermissions(perform: [
          await file.delete(),
          await file.parent.delete(),]);
    await LocalResourceRepository().deleteResourceModel(file.path);
  }

  Future update({required File oldFile, required File file}) async {
    File newFile;
    Directory parent;
    String name = FileUtils.getEntityName(oldFile.path);
    await PermissionRequestHandler().requestPermissions(perform: [
      (parent = await oldFile.parent.rename(file.parent.path)).path,
      newFile = File("${parent.path}\\$name"),
      newFile = await newFile.rename(file.path),
    ]);
    await LocalResourceRepository()
        .updateResourceModel(oldFile.path, newFile.path);
  }
}
