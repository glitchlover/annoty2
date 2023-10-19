import 'dart:math';

import 'package:annoty/app/core/constants/color/core.dart';
import 'package:annoty/app/core/constants/ui/sizing.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/widgets/pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class AnnotyReaderPage extends StatelessWidget {
  const AnnotyReaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [const PdfViewer(), ToolBox(isLight: false)],
    ));
  }
}

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
            Tool('Exit'),
            Spacer(),
            Tool('Previous Page'),
            Tool('Search Page'),
            Tool('Next Page'),
            Spacer(),
            Tool('Zoom In'),
            Tool('Custom Zoom'),
            Tool('Zoom Out'),
            Spacer(),
            Tool('Search Text'),
            Spacer(),
            Tool('Bookmark'),
            Tool('Annotation Bar')
          ],
        ),
      ),
    );
  }
}

class Tool extends StatelessWidget {
  final String tool;
  const Tool(this.tool ,{super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tool,  
      child: Container(
        height: 36,
        width: 36,
        color: Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), Random().nextDouble()),
        child: const Icon(Icons.abc)
      ),
    );
  }
}
