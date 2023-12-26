import 'dart:io';

import 'package:annoty/app/core/constants/database/resource_file_tree.dart';
import 'package:annoty/app/presentation/shared/controllers/resource_directory_system_controller.dart';
import 'package:flutter/material.dart';
import 'package:annoty/app/core/theme/my_text.dart';
import 'package:get/get.dart';

class MyEntityRenameDialog extends StatelessWidget {
  MyEntityRenameDialog({super.key, required this.entity});
  final Directory entity;
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
            child: const Icon(Icons.check),
            onPressed: () {
              Get.find<ResourceDirectorySystemController>().updateResource(
                  oldDir: entity,
                  dir: Directory("${kResourceDir.path}\\${_controller.text}"),
                  op: 2);
              const Duration(milliseconds: 1000);
              Navigator.of(context).pop();
            }),
        TextButton(
            child: const Icon(Icons.cancel),
            onPressed: () {
              Navigator.of(context).pop();
            })
      ],
    );
  }
}
