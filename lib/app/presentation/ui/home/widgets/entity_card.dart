import 'dart:io';

import 'package:annoty/app/core/routes/pdf_reader_routes.dart';
import 'package:annoty/app/presentation/shared/widget/my_pop_up_menu.dart';
import 'package:flutter/material.dart';

import 'package:annoty/app/core/theme/my_text.dart';
import 'package:get/get.dart';

class ResourceNoteBookCard extends StatelessWidget {
  const ResourceNoteBookCard({super.key, required this.entity});
  final FileSystemEntity entity;

  @override
  Widget build(BuildContext context) {
    String name = entity.path.split("\\").last;

    return entity.statSync().type == FileSystemEntityType.directory
        ? ResourceNotebookTile(name: name, entity: entity)
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
  final FileSystemEntity entity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: ListTile(
          title: MyText(name).paragraph(),
          leading: const Icon(Icons.book_outlined),
          trailing: MyPopUpMenu(entity),
        ),
        onTap: () {
          Get.toNamed(PdfReaderRoutes.pdfReader);
        });
  }
}
