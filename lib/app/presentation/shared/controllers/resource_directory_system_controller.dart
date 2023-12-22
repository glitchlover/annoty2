import 'dart:io';
import 'package:annoty/app/core/constants/misc/objects.dart';
import 'package:annoty/app/core/resources/logger/logger.dart';
import 'package:annoty/app/core/services/document_service_repository.dart';
import 'package:annoty/app/core/utils/file_utils.dart';
import 'package:annoty/app/database/repositories/local/resource_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ResourceDirectorySystemController extends GetxController {
  AppFileService resourceService = ConstObject.resourceService;
  RxList<FileSystemEntity> resourceList = <FileSystemEntity>[].obs;
  Rx<int> resourceListSize = 0.obs;

  @override
  void onInit() async {
    resourceList.value = await ConstObject.resourceService.children;
    resourceListSize.value = resourceList.length;
    super.onInit();
  }

  Future pickPdf() async {
    FilePickerResult? pick = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (pick == null) return;
    addResource(file: File(pick.files.first.path!));
    String outputPath = await makeResourceFolder(pick);
    // await pdfService.copyFile(outputPath, File(pick.files.first.path!));
    await LocalResourceRepository().saveResourceModel(outputPath);
  }

  Future<String> makeResourceFolder(FilePickerResult pick) async {
    String destinationFolderName =
        FileUtils.getFileNameWithoutExt(pick.files.first.path!);
    String destinationFolderPath =
        "${resourceService.document.path}\\$destinationFolderName";
    await resourceService.makeFolder(
        name: destinationFolderName, parent: resourceService.document);
    Flog.success(destinationFolderPath, description: "successfully created");
    return 'destinationFolderPath';
  }

  void addResource({required File file}) {
    resourceList.add(file);
    resourceListSize.value += 1;
    resourceListSize.refresh();
    resourceList.refresh();
  }

  void delResources({required File file}) async {
    resourceList.remove(file);
    resourceListSize.value -= 1;
    resourceListSize.refresh();
    resourceList.refresh();
    update();
  }
}
