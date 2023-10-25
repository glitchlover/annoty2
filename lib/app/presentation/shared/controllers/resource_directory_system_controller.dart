import 'dart:io';

import 'package:annoty/app/database/functions/old_document_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ResourceDirectorySystemController extends GetxController {
  DocumentServices pdfService =
      DocumentServices( documentFolderName: "Resource",  documentType: "pdf");
  RxList<FileSystemEntity> get resourceList => pdfService
      .getChildrenFolder(directory: pdfService. documentFolder, currentDepth: 1)
      .obs;
  Rx<int> get resourceListSize => resourceList.length.obs;

  pickPdf() async {
    FilePickerResult? pick = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (pick == null) return;
    String outputPath = await makeResourceFolder(pick);
    pdfService.copyFile(outputPath, File(pick.files.first.path!));
    updateResources();
  }

  Future<String> makeResourceFolder(FilePickerResult pick) async {
    String fileName = pick.files.first.path!.split("\\").last;
    String folderName =
        fileName.replaceRange(fileName.lastIndexOf("."), fileName.length, "");
    String folderPath = "${pdfService. documentFolder.path}\\$folderName";
    await pdfService.mkFolder(folderName, pdfService. documentFolder);
    return folderPath;
  }

  updateResources() async {
    resourceList.value = pdfService.entities;
    resourceListSize.refresh();
    resourceList.refresh();
    update();
  }
}
