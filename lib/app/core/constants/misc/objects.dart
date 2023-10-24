import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ConstObject {
  final PdfViewerController pdfViewerController = PdfViewerController();
  static final ConstObject _singleton = ConstObject._create();

  ConstObject._create();

  factory ConstObject(){
    return _singleton;
  }
}
