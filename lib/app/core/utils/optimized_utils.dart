import 'dart:io';

import 'package:pdf/widgets.dart';

class OptimizedUtils {
  Future<void> optimizePdf(String inputFilePath, String outputFilePath) async {
    final Document pdf = Document();

    final MemoryImage image =
        MemoryImage(await File(inputFilePath).readAsBytes());
    pdf.addPage(Page(
      build: (Context context) {
        return Image(image); // Use the Image widget with ImageProvider
      },
    ));

    final optimizedPdfData = await pdf.save();

    await File(outputFilePath).writeAsBytes(optimizedPdfData);
    print('PDF optimization complete.');
  }
}
