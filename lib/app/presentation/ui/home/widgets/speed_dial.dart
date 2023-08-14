import 'package:annoty/app/core/constants/color/core.dart';
import 'package:annoty/app/core/controllers/pdf_directory_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFloatingActionButton extends GetView<PdfDirectoryController> {
  const MyFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: MyCoreColor.activeBlack,
        ),
        onPressed: () {
          controller.pickPdf();
        });
  }
}
