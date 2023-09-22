import 'dart:io';
import 'dart:typed_data';
import 'package:annoty/app/presentation/ui/annoty_reader/widgets/show_context_menu.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class AnnotyReaderController extends GetxController {
  late final File pdfFile;
  late final Uint8List pdfBytes;
  final PdfViewerController pdfViewerController = PdfViewerController();
  final ShowContextMenu contextMenu = ShowContextMenu();

  @override
  void onInit(){
    setPdfDataAndBytes();
    super.onInit();
  }

  @override
  void onClose() {
    contextMenu.handleContextMenuClose();
    super.onClose();
  }

  void setPdfDataAndBytes() async{
    pdfFile = Get.arguments;
    pdfBytes = await pdfFile.readAsBytes();
    print("pdf file: $pdfFile");
  }
}
