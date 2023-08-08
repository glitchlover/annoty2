import 'dart:io';

import 'package:annoty/app/services/document_service.dart';
import 'package:annoty/app/core/controllers/pdf_directory_controller.dart';
import 'package:annoty/app/presentation/shared/widget/my_icon_button.dart';
import 'package:annoty/app/presentation/shared/widget/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class EntityDialoges {
  TextEditingController txtCtrl = TextEditingController();

  PdfDirectoryController pdfDirViewerCtrl =
      Get.find<PdfDirectoryController>();

  void add(Directory dir, [bool? isFile]) {
    Get.dialog(AlertDialog(
      content: MyTextField(
        label: 'File Name',
        txtController: txtCtrl,
      ).scaleton(),
      actions: [
        MyIconButton(
                onPressed: () {
                  Navigator.pop(Get.context!);
                  isFile == null
                      ? DocumentServices.mkFolder(txtCtrl.text, dir)
                      : pdfDirViewerCtrl.pdfService
                          .mkFile(txtCtrl.text, dir);
                  pdfDirViewerCtrl.updateFentities();
                  txtCtrl.text = "";
                },
                icon: const Icon(Icons.check))
            .cicle()
      ],
    ));
  }
}
