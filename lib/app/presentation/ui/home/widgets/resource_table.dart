import 'package:annoty/app/presentation/shared/controllers/resource_directory_system_controller.dart';
import 'package:annoty/app/presentation/ui/home/widgets/resource_note_book_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResourceTable extends StatelessWidget {
  const ResourceTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GetBuilder<ResourceDirectorySystemController>(
            builder: (controller) => ListView.builder(
                shrinkWrap: true,
                itemBuilder: (_, index) => ResourceNoteBookCard(
                    entity: controller.resourceList[index]),
                itemCount: controller.resourceListSize.value)));
  }
}
