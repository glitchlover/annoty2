import 'package:annoty/app/core/controllers/pdf_directory_controller.dart';
import 'package:annoty/app/presentation/ui/home/widgets/entity_add_dialoges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

SpeedDial floatingActionButton() {
    PdfDirectoryController pdfDirCtrl = Get.put(PdfDirectoryController());
    return SpeedDial(
      visible: true,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.folder_rounded),
          label: "add folder",
          onTap: () => EntityDialoges().add(pdfDirCtrl.pdfService.dbFolder),
        ),
        SpeedDialChild(
          child: const Icon(Icons.drive_folder_upload_rounded),
          label: "upload folder",
        onTap: () async {
          },
        ),
        SpeedDialChild(
            child: const Icon(Icons.picture_as_pdf_rounded),
            label: "add pdf",
            onTap: () {
              pdfDirCtrl.pickPdf();
            }),
      ],
      child: const Icon(Iconsax.add),
    );
  }