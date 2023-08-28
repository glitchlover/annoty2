import 'package:annoty/app/presentation/ui/home/widgets/annoty_search_tool.dart';
import 'package:annoty/app/presentation/ui/home/widgets/home_app_bar.dart';
import 'package:annoty/app/presentation/ui/home/widgets/resource_table.dart';
import 'package:annoty/app/presentation/ui/home/widgets/my_floating_action_button.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeAppBar().paint(),
        floatingActionButton: const MyFloatingActionButton(),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              AnnotySearchTool(),
              ResourceTable(), //todo - make it list later
            ],
          ),
        ));
  }
}

