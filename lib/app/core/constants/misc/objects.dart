import 'package:annoty/app/core/services/document_service_repository.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ConstObject {
  static final PdfViewerController pdfViewerController = PdfViewerController();
  static final AppFileServices pdfFileSercices =
      AppFileServices(documentName: "Resource", documentType: "pdf");
}
