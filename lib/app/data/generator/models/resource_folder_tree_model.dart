// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

class ResourceFolderTreeModel {
  final Directory resourceDbFolder;

  File get pdfFile => File(
      "${resourceDbFolder.path}\\${resourceDbFolder.path.split("\\").last}.pdf");
  File get annotationJson => File("${resourceDbFolder.path}/annotation.json");
  File get resourceConfigFolder => File("${resourceDbFolder.path}/config.json");

  ResourceFolderTreeModel({required this.resourceDbFolder});
}
