import 'package:annoty/app/presentation/ui/home/home_controller.dart';
import 'package:annoty/app/presentation/ui/home/widgets/entity_card.dart';
import 'package:flutter/material.dart';

class ResourceTable extends StatelessWidget {
  const ResourceTable({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (_, index) =>
                EntityCard(entity: controller.pdfDirEntityList[index]),
            itemCount: controller.pdfDirEntityListSize),
    );
  }
}
