import 'dart:io';

import 'package:annoty/app/core/theme/my_text.dart';
import 'package:annoty/app/core/controllers/resource_directory_system_controller.dart';
import 'package:annoty/app/presentation/shared/dialogs/my_entity_rename_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPopUpMenu extends StatelessWidget {
  final FileSystemEntity entity;
  const MyPopUpMenu(this.entity, {super.key});
  
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
        splashRadius: 15,
        onSelected: (value) {
          if (value == "rename") {
          showDialog(
            context: Get.context!,
            builder: (_) =>
                MyEntityRenameDialog(isFolder: entity.statSync().type == FileSystemEntityType.directory? true: false, entity: entity));
          }
        },
        itemBuilder: (context) => [
              const PopupMenuItem<String>(
                  value: 'rename',
                  child: MyText('Rename'),
              ),
              PopupMenuItem<String>(
                value: 'delete',
                child: const MyText('Delete'),
                onTap: () {
                  entity.delete();
                  Get.find<ResourceDirectorySystemController>()
                      .updateResources();
                },
              ),
            ]);
  }
}