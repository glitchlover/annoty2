// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:objectbox/objectbox.dart';

import 'package:annoty/app/database/models/annotation.dart';
import 'package:annoty/app/database/models/resource_model.dart';

@Entity()
class Tag {
  int? id;
  final String name;
  final int color;
  final ToMany<ResourceModel> resources = ToMany<ResourceModel>();
  final ToMany<Annotation> annotations = ToMany<Annotation>();

  Tag({
    this.id,
    required this.name,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'color': color,
    };
  }

  factory Tag.fromMap(Map<String, dynamic> map) {
    return Tag(
      id: map['id'] as int,
      name: map['name'] as String,
      color: map['color'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tag.fromJson(String source) =>
      Tag.fromMap(json.decode(source) as Map<String, dynamic>);
}
