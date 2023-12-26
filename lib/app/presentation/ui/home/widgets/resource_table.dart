part of home;

class ResourceTable extends GetView<ResourceDirectorySystemController> {
  const ResourceTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Obx(() => ListView.builder(
            shrinkWrap: true,
            itemCount: controller.resourceCount.value,
            itemBuilder: (_, index) => Obx(() {
                  return ResourceNoteBookCard(
                      entity: controller.resourceList[index]);
                }))));
  }
}
