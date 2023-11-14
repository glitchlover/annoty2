import 'dart:io';

import 'package:annoty/app/core/resources/logger/logger.dart';
import 'package:annoty/app/core/utils/file_utils.dart';
import 'package:annoty/app/database/providers/local/resource_repository.dart';
import 'package:annoty/app/database/providers/old_document_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ResourceDirectorySystemController extends GetxController {
  DocumentServices pdfService =
      DocumentServices(documentFolderName: "Resource", documentType: "pdf");
  RxList<FileSystemEntity> get resourceList => pdfService
      .getChildrenFolder(directory: pdfService.documentFolder, currentDepth: 1)
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
    String destinationFolderName =
        FileUtils.getFileNameWithoutExt(pick.files.first.path!);
    String destinationFolderPath =
        "${pdfService.documentFolder.path}\\$destinationFolderName";
    Flog.info(destinationFolderName);
    Flog.info(await LocalResourceRepository().saveResourceModel(destinationFolderPath));
    await pdfService.mkFolder(destinationFolderName, pdfService.documentFolder);
    return destinationFolderPath;
  }

  updateResources() async {
    resourceList.value = pdfService.entities;
    resourceListSize.refresh();
    resourceList.refresh();
    update();
  }
}
