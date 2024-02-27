import 'dart:io';
import 'package:annoty/core/constants/database/resource_file_tree.dart';
import 'package:annoty/core/constants/misc/objects.dart';
import 'package:annoty/core/resources/logger/logger.dart';
import 'package:annoty/core/utils/file_utils.dart';
import 'package:annoty/app/database/repositories/local/resource_repository.dart';
import 'package:annoty/app/domain/usecases/resource_usecase.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ResourceDirectorySystemController extends GetxController {
  RxList<Directory> resourceList = <Directory>[].obs;
  Rx<int> resourceCount = 0.obs;

  @override
  void onInit() async {
    await kAppFileService.initializingWorkingDirectory(name: "Resource");
    await updateResourceState();
    for (var resouce in await LocalResourceRepository().getAllResource()) {
      Flog.info(resouce.filePath);
    }
    super.onInit();
  }

  Future pickPdf() async {
    FilePickerResult? pdfPicks = await FilePicker.platform.pickFiles(
        allowMultiple: true, type: FileType.custom, allowedExtensions: ['pdf']);

    if (pdfPicks == null) return;
    for (String? pdfPath in pdfPicks.paths) {
      if (pdfPath == null) return;
      Directory newResource = await initiateResource(pdfPath);
      await updateResource(dir: newResource, op: 0);
    }
  }

  Future<Directory> initiateResource(String pdfPath) async {
    String dirName = FileUtils.getFileNameWithoutExt(pdfPath);
    String path =
        (await kAppFileService.makeFolder(name: dirName, parent: kResourceDir))
            .path;
    File file = await kAppFileService.copyFile(path: path, file: File(pdfPath));
    return FileUtils.getFolderFromFile(file);
  }

/* ============================================================================
 * `op` -> shortname for operation
 * ============================================================================
 * selects which operation will it chose
 * op == 0: addResource
 * op == 1: deleteResource
 * op == 2: renameResource; also note that oldfile is needed in case 2
 *
 * ========================================================================== */
  Future<void> updateResource(
      {required Directory dir, required int op, Directory? oldDir}) async {
    File file = FileUtils.getResourceFileFromFolder(dir);
    Flog.info(file);
    switch (op) {
      case 0:
        await ResourceUsecase().add(file: file);
        break;
      case 1:
        await ResourceUsecase().delete(file: file);
        break;
      case 2:
        File oldFile = FileUtils.getResourceFileFromFolder(oldDir!);
        await ResourceUsecase().update(oldFile: oldFile, file: file);
      default:
        break;
    }
    await updateResourceState();
  }

  Future<void> updateResourceState() async {
    resourceList.value =
        await kAppFileService.getSubdirectories(folder: kResourceDir);
    resourceCount.value = resourceList.length;
  }
}
