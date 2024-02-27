import 'dart:io';
import 'dart:typed_data';

import 'package:annoty/core/routes/pdf_reader_routes.dart';
import 'package:annoty/app/database/models/resource_folder_tree_model.dart';
import 'package:annoty/app/presentation/shared/widget/my_pop_up_menu.dart';
import 'package:flutter/material.dart';

import 'package:annoty/core/theme/my_text.dart';
import 'package:get/get.dart';

class ResourceNoteBookCard extends StatelessWidget {
  const ResourceNoteBookCard({super.key, required this.entity});
  final FileSystemEntity entity;

  @override
  Widget build(BuildContext context) {
    String name = entity.path.split("\\").last;

    return entity.statSync().type == FileSystemEntityType.directory
        ? ResourceNotebookTile(name: name, entity: entity as Directory)
        : Container();
  }
}

class ResourceNotebookTile extends StatelessWidget {
  const ResourceNotebookTile({
    Key? key,
    required this.name,
    required this.entity,
  }) : super(key: key);

  final String name;
  final Directory entity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: ListTile(
          title: MyText(name).paragraph(),
          leading: const Icon(Icons.book_outlined),
          trailing: MyPopUpMenu(entity),
        ),
        onTap: () async {
          File pdfFile =
              ResourceFolderTreeModel(resourceDbFolder: entity).pdfFile;
          Uint8List pdfBytes = await pdfFile.readAsBytes();
          Get.toNamed(PdfReaderRoutes.pdfReader,
              arguments: pdfBytes, parameters: {'pdfFile': pdfFile.path});
        });
  }
}
