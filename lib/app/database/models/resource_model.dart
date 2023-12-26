// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:objectbox/objectbox.dart';

import 'package:annoty/app/database/models/annotation.dart';
import 'package:annoty/app/database/models/metadata.dart';
import 'package:annoty/app/database/models/tag.dart';

@Entity()
class ResourceModel {
  int? id;
  String name;
  String customName;
  String filePath;
  @Property(type: PropertyType.date)
  DateTime createdDate;
  @Property(type: PropertyType.date)
  DateTime modifiedDate;
  ToOne<Metadata> metadata = ToOne<Metadata>();
  @Backlink()
  ToMany<Annotation> annotations = ToMany<Annotation>();
  ToMany<Tag> tags = ToMany<Tag>();

  ResourceModel({
    this.id,
      required this.name,
      required this.customName,
      required this.filePath,
      required this.createdDate,
      required this.modifiedDate,
      });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'customName': customName,
      'filePath': filePath,
      'createdDate': createdDate.millisecondsSinceEpoch,
      'modifiedDate': modifiedDate.millisecondsSinceEpoch,
    };
  }

  factory ResourceModel.fromMap(Map<String, dynamic> map) {
    return ResourceModel(
      id: map['id'] as int,
      name: map['name'] as String,
      customName: map['customName'] as String,
      filePath: map['filePath'] as String,
      createdDate:
          DateTime.fromMillisecondsSinceEpoch(map['createdDate'] as int),
      modifiedDate:
          DateTime.fromMillisecondsSinceEpoch(map['modifiedDate'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResourceModel.fromJson(String source) =>
      ResourceModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
