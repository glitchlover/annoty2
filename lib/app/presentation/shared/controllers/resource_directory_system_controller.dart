import 'dart:io';

import 'package:annoty/app/services/document_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ResourceDirectorySystemController extends GetxController {
  DocumentServices pdfService =
      DocumentServices(dbFolderName: "Resource", dbType: "pdf");
  RxList<FileSystemEntity> get resourceList => pdfService
      .getChildrenFolder(directory: pdfService.dbFolder, currentDepth: 1)
      .obs;
  Rx<int> get resourceListSize => resourceList.length.obs;

  pickPdf() async {
    FilePickerResult? pick = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (pick == null) return;
    String folderPath = await makeResourceFolder(pick);
    pdfService.copyFile(folderPath, File(pick.files.first.path!));
    updateResources();
  }

  Future<String> makeResourceFolder(FilePickerResult pick) async {
    String file = pick.files.first.path!.split("\\").last;
    String folder = file.replaceAll(file.split(".").last, "");
    String folderPath = "${pdfService.dbFolder.path}\\$folder";
    await pdfService.mkFolder(folder, pdfService.dbFolder);
    return folderPath;
  }

  updateResources() async {
    resourceList.value = pdfService.entities;
    resourceListSize.refresh();
    resourceList.refresh();
    update();
  }
}
