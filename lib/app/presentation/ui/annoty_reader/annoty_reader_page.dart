import 'package:annoty/app/presentation/ui/annoty_reader/widgets/pdf_viewer.dart';
import 'package:flutter/material.dart';

class AnnotyReaderPage extends StatelessWidget{
  const AnnotyReaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolMenu(), 
      body: const PdfViewer()
      );
  }
}

class ToolMenu extends AppBar {
  ToolMenu({super.key});

}
