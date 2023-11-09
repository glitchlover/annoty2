import 'package:annoty/app/database/models/resource_model.dart';

class AnnotationEntity {
  final String text;
  final String keyWords;
  final String? comment;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final List<double> annoLocation;
  final ResourceModel resource;
  AnnotationEntity({
    required this.text,
    required this.keyWords,
    required this.comment,
    required this.createdDate,
    required this.modifiedDate,
    required this.annoLocation,
    required this.resource,
  });
}
