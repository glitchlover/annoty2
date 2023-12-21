import 'dart:io';
import 'package:annoty/app/core/resources/logger/logger.dart';
import 'package:annoty/app/core/utils/file_utils.dart';
import 'package:annoty/app/database/repositories/local/resource_repository.dart';
import 'package:annoty/app/database/repositories/old_document_service.dart';
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

  Future pickPdf() async {
    FilePickerResult? pick = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (pick == null) return;
    addResource(newFile: File(pick.files.first.path!));
    String outputPath = await makeResourceFolder(pick);
    await pdfService.copyFile(outputPath, File(pick.files.first.path!));
    await LocalResourceRepository().saveResourceModel(outputPath);
  }

  Future<String> makeResourceFolder(FilePickerResult pick) async {
    String destinationFolderName =
        FileUtils.getFileNameWithoutExt(pick.files.first.path!);
    String destinationFolderPath =
        "${pdfService.documentFolder.path}\\$destinationFolderName";
    await pdfService.mkFolder(destinationFolderName, pdfService.documentFolder);
    Flog.success(destinationFolderPath, description: "successfully created");
    return destinationFolderPath;
  }

  void addResource({required File newFile}) {
    resourceList.add(newFile);
    resourceListSize.value += 1;
    resourceListSize.refresh();
    resourceList.refresh();
  }

  updateResources() async {
    resourceList.value = pdfService.entities;
    resourceListSize.refresh();
    resourceList.refresh();
    update();
  }
}
