import 'package:get/get.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/annoty_reader_binding.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/annoty_reader_page.dart';

class PdfReaderRoutes {
  PdfReaderRoutes._();

  static const pdfReader = '/home/pdfReader';

  static final routes = [
    GetPage(
      name: pdfReader,
      page: () => const AnnotyReaderPage(),
      binding: AnnotyReaderBinding(),
    ),
  ];
}
