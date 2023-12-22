import 'dart:io';

import 'package:annoty/app/presentation/shared/controllers/resource_directory_system_controller.dart';
import 'package:flutter/material.dart';
import 'package:annoty/app/core/theme/my_text.dart';
import 'package:get/get.dart';

class MyEntityRenameDialog extends StatelessWidget {
  MyEntityRenameDialog({super.key, required this.entity});
  final FileSystemEntity entity;
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const MyText("File Name"),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(hintText: "Untitle"),
      ),
      actions: [
        TextButton(
            onPressed: () async{
              ResourceDirectorySystemController ctrl =
                  Get.find<ResourceDirectorySystemController>();
              String folderPath = (await ctrl.resourceService
                  .updateFolder(name: _controller.text, folder: entity as Directory))
                  .path;
              String filePath =
                  "$folderPath\\${entity.path.split("\\").last}.pdf";
              ctrl.resourceService.updateFile(name: _controller.text, file: File(filePath));
              ctrl.addResource(file: File(filePath));
              // TODO: Navigator.of(context).pop();
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
