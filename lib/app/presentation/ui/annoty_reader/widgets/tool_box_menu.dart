import 'package:annoty/app/core/constants/color/core.dart';
import 'package:annoty/app/core/constants/ui/tool_box.dart';
import 'package:annoty/app/core/logger/logger.dart';
import 'package:annoty/app/core/routes/home_routes.dart';
import 'package:annoty/app/core/theme/my_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ToolBox extends StatelessWidget {
  ToolBox(
      {super.key,
      this.controller,
      this.onTap,
      this.color,
      this.disableColor,
      this.textColor,
      this.panFillColor,
      this.chooseFileFillColor,
      this.zoomFillColor,
      this.serchFillColor,
      this.settingsFillColor,
      required this.isLight});
  final PdfViewerController? controller;
  final TapRegionCallback? onTap;
  final Color? color;
  final Color? disableColor;
  final Color? textColor;
  final Color? panFillColor;
  final Color? chooseFileFillColor;
  final Color? zoomFillColor;
  final Color? serchFillColor;
  final Color? settingsFillColor;
  final int pageCount = 0;
  final double zoomLevel = 1;
  final GlobalKey searchKey = GlobalKey();
  final GlobalKey zoomPercentageKey = GlobalKey();
  final GlobalKey settingsKey = GlobalKey();
  final GlobalKey focusNode = GlobalKey();
  final bool isWeb = false;
  final bool showTooltip = true;
  late final bool isLight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      color: ConstColorMain.backgroundDark,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Tool(ToolItem.exit),
            Spacer(),
            Tool(ToolItem.prePage),
            Tool(ToolItem.searchPage),
            Tool(ToolItem.nextPage),
            Spacer(),
            Tool(ToolItem.zIn),
            Tool(ToolItem.zCust),
            Tool(ToolItem.zOut),
            Spacer(),
            Tool(ToolItem.searchText),
            Spacer(),
            Tool(ToolItem.bookmark),
            Tool(ToolItem.annoBar)
          ],
        ),
      ),
    );
  }
}

class Tool extends StatelessWidget {
  final ToolItem toolItem;
  String? get tool => toolName[toolItem];
  const Tool(this.toolItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tool,
      child: GestureDetector(
        onTap: () async {
          switch (toolItem) {
            case ToolItem.exit:
              await Get.offAndToNamed(HomeRoutes.home);
              break;
            default:
              Flog.info(toolItem);
          }
        },
        child: SizedBox(
          height: 36,
          width: 36,
          child: (toolItem != ToolItem.searchPage ||
                  toolItem != ToolItem.searchText ||
                  toolItem != ToolItem.zCust)
              ? Icon(toolIcon[toolItem], color: Colors.grey)
              : toolItem == ToolItem.zCust
                  ? Container(color: Colors.blue)
                  : Container(
                      height: 15,
                      width: 15,
                      color: Colors.red,
                    ),
        ),
      ),
    );
  }
}
