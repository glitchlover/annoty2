import 'package:annoty/app/presentation/shared/controllers/resource_directory_system_controller.dart';
import 'package:annoty/app/presentation/ui/home/widgets/resource_note_book_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResourceTable extends GetView<ResourceDirectorySystemController> {
  const ResourceTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Obx(() => ListView.builder(
            shrinkWrap: true,
            itemCount: controller.resourceListSize.value,
            itemBuilder: (_, index) => Obx(() {
                  return ResourceNoteBookCard(
                      entity: controller.resourceList[index]);
                }))));
  }
}
