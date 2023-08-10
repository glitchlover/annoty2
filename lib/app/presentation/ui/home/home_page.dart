import 'package:annoty/app/presentation/ui/home/home_controller.dart';
import 'package:annoty/app/presentation/ui/home/widgets/app_bar.dart';
import 'package:annoty/app/presentation/ui/home/widgets/speed_dial.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/entity_card.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeAppBar().paint(),
        floatingActionButton: floatingActionButton(),
        body: Obx(() => ListView.builder(
            shrinkWrap: true,
            itemBuilder: (_, index) =>
                EntityCard(entity: controller.pdfDirEntityList[index]),
            itemCount: controller.pdfDirEntityListSize)));
  }
}
