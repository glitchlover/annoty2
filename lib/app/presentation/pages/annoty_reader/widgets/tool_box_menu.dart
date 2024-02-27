import 'package:annoty/core/constants/color/core.dart';
import 'package:annoty/core/constants/ui/sizing.dart';
import 'package:annoty/core/constants/ui/tool_box.dart';
import 'package:annoty/app/presentation/pages/annoty_reader/controllers/annoty_study_engine_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToolBox extends StatelessWidget implements PreferredSizeWidget {
  const ToolBox({super.key});

  @override
  Size get preferredSize => Size.fromHeight(ConstSizing.size_4_13);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      color: ConstColorMain.primaryBGDark,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Tool(ToolItem.exit),
            Spacer(),
            Tool(ToolItem.prePage),
            // Tool(ToolItem.searchPage),
            Tool(ToolItem.nextPage),
            Spacer(),
            Tool(ToolItem.zIn),
            // Tool(ToolItem.zCust),
            Tool(ToolItem.zOut),
            Spacer(),
            // Tool(ToolItem.searchText),
            Spacer(),
            Tool(ToolItem.bookmark),
            Tool(ToolItem.annoBar)
          ],
        ),
      ),
    );
  }
}

class Tool extends GetView<ToolBoxMenuController> {
  final ToolItem toolItem;
  String? get tool => toolName[toolItem];
  const Tool(this.toolItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (toolItem) {
          case ToolItem.exit:
            Navigator.pop(Get.context!);
            break;
          case ToolItem.nextPage:
            controller.pdfViewerController.nextPage();
            break;
          case ToolItem.prePage:
            controller.pdfViewerController.previousPage();
            break;
          case ToolItem.zOut:
            controller.pdfViewerController.zoomLevel -= 0.125;
            break;
          case ToolItem.zIn:
            controller.pdfViewerController.zoomLevel += 0.125;
            break;
          case ToolItem.bookmark:
            controller.toggleBookmark();
            break;
          case ToolItem.annoBar:
            Get.find<AnnotationSideBarController>().isAnnoBarOpen.toggle();
            break;
          default:
            // Flog.info(toolItem);
        }
      },
      child: SizedBox(
        height: 36,
        width: 36,
        child: Icon(toolIcon[toolItem], color: Colors.grey)
      ),
    );
  }
}
