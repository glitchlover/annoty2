import 'dart:io';

import 'package:annoty/app/core/constants/database/db.dart';
import 'package:annoty/app/services/document_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PdfDirectoryController extends GetxController {
  DocumentServices pdfService = DocumentServices(db: "Resource", dbType: "pdf");

  late RxList<FileSystemEntity> fentities = pdfService.entities.obs;

  updateFentities() async {
    fentities.value = await pdfService.initDbEntities();
    fentities.refresh();
    update();
  }

  pickPdf() async {
    FilePickerResult? pick = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (pick == null) return;
    String file = pick.files.first.path!.split("\\").last;
    String folder = file.replaceAll(file.split(".").last, "");
    String folderPath = "${pdfService.dbFolder.path}\\$folder";
    // print("🟢 pickPdf: " + );
    pdfService.mkFolder(folder, pdfService.dbFolder);
    pdfService.copyFile(folderPath, File(pick.files.first.path!));
    updateFentities();
  }
}
