import 'dart:io';

import 'package:annoty/app/core/routes/pdf_reader_routes.dart';
import 'package:annoty/app/presentation/shared/widget/my_pop_up_menu.dart';
import 'package:flutter/material.dart';

import 'package:annoty/app/core/theme/my_text.dart';
import 'package:get/get.dart';

int level = 0;

class EntityCard extends StatelessWidget {
  const EntityCard({super.key, required this.entity});
  final FileSystemEntity entity;

  @override
  Widget build(BuildContext context) {
    String name = entity.path.split("\\").last;

    return entity.statSync().type == FileSystemEntityType.file
        ? PdfTile(name: name, entity: entity)
        : FolderTile(name: name, entity: entity);
  }
}

class FolderTile extends StatelessWidget {
  const FolderTile({
    Key? key,
    required this.name,
    required this.entity,
  }) : super(key: key);

  final String name;
  final FileSystemEntity entity;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      maintainState: true,
      childrenPadding: const EdgeInsets.only(left: 53),
      expandedCrossAxisAlignment: CrossAxisAlignment.center,
      controlAffinity: ListTileControlAffinity.leading,
      title: MyText(name).paragraph(),
      leading: const Icon(Icons.folder),
      trailing: MyPopUpMenu(entity),
      children: (entity as Directory).listSync().map((element) {
        level++;
        return EntityCard(entity: element);
      }).toList(),
    );
  }
}

class PdfTile extends StatelessWidget {
  const PdfTile({
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
