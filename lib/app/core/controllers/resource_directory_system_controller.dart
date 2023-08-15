import 'dart:io';

import 'package:annoty/app/services/document_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ResourceDirectorySystemController extends GetxController {
  DocumentServices pdfService =
      DocumentServices(dbFolderName: "Resource", dbType: "pdf");
  RxList<Directory> get resourceList => pdfService
      .getChildrenFolder(directory: pdfService.dbFolder, currentDepth: 1)
      .obs;
  Rx<int> get resourceListSize => resourceList.length.obs;

  updateResources() async {
    resourceList.value = pdfService.entities as List<Directory>;
    resourceList.refresh();
    update();
  }

  pickPdf() async {
    FilePickerResult? pick = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (pick == null) return;
    String file = pick.files.first.path!.split("\\").last;
    String folder = file.replaceAll(file.split(".").last, "");
    String folderPath = "${pdfService.dbFolder.path}\\$folder";
    pdfService.mkFolder(folder, pdfService.dbFolder);
    pdfService.copyFile(folderPath, File(pick.files.first.path!));
    updateResources();
  }
}
