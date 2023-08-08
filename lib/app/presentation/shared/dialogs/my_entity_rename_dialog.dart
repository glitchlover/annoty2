import 'dart:io';

import 'package:annoty/app/core/controllers/pdf_directory_controller.dart';
import 'package:flutter/material.dart';
import 'package:annoty/app/core/theme/my_text.dart';
import 'package:get/get.dart';

class MyEntityRenameDialog extends StatelessWidget {
  MyEntityRenameDialog({super.key, required this.isFolder, required this.entity});
  final bool isFolder;
  final FileSystemEntity entity;
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: isFolder?const MyText("Folder Name"): const MyText("File Name"),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(hintText: "Untitle"),
      ),
      actions: [
        TextButton(
            onPressed: () {
              PdfDirectoryController ctrl = Get.find<PdfDirectoryController>();
              isFolder?ctrl.pdfService.updateFolder(_controller.text, entity as Directory): ctrl.pdfService.updateFile(_controller.text, entity as File);
              ctrl.updateFentities();
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.check)),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.cancel))
      ],
    );
  }
}
