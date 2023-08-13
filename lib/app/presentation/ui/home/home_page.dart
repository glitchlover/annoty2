import 'package:annoty/app/presentation/ui/home/home_controller.dart';
import 'package:annoty/app/presentation/ui/home/widgets/annoty_search_tool.dart';
import 'package:annoty/app/presentation/ui/home/widgets/home_app_bar.dart';
import 'package:annoty/app/presentation/ui/home/widgets/speed_dial.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeAppBar().paint(),
        floatingActionButton: floatingActionButton(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: AnnotySearchTool(controller: controller),
              ),
            ],
          ),
        ));
  }
}