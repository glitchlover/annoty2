
import 'package:annoty/app/presentation/ui/annoty_reader/widgets/pdf_viewer.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/widgets/tool_box_menu.dart';
import 'package:flutter/material.dart';

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
