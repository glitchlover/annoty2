import 'package:flutter/material.dart';

class ResourceModel {
  final String name;
  final String customName;
  final String filePath;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final Metadata metadata;
  final List<Annotation>? annotations;
  final List<Tag>? tags;

  ResourceModel(
      {required this.name,
      required this.customName,
      required this.filePath,
      required this.createdDate,
      required this.modifiedDate,
      required this.metadata,
      required this.annotations,
      required this.tags});
}

class Annotation {
}

class Metadata {
  final List<String>? authours;
  final DateTime? published;
  final String? publisher;

  Metadata(
      {this.authours,
      this.published,
      this.publisher});
}

class Tag {
  final String name;
  final Color color;

  Tag({required this.name, required this.color});
}
