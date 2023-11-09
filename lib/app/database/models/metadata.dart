// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:objectbox/objectbox.dart';

import 'package:annoty/app/database/models/resource_model.dart';

@Entity()
class Metadata {
  int? id;

  final List<String>? authours;
  final String? publisher;
  @Property(type: PropertyType.date)
  final DateTime? published;
  final ToOne<ResourceModel> resource = ToOne<ResourceModel>();

  Metadata({
    this.id,
    this.authours,
    this.published,
    this.publisher,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'authours': authours,
      'publisher': publisher,
      'published': published?.millisecondsSinceEpoch,
    };
  }

  factory Metadata.fromMap(Map<String, dynamic> map) {
    return Metadata(
      id: map['id'] as int,
      authours: map['authours'] != null ? List<String>.from((map['authours'] as List<String>)): null,
      publisher: map['publisher'] != null ? map['publisher'] as String : null,
      published: map['published'] != null ? DateTime.fromMillisecondsSinceEpoch(map['published'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Metadata.fromJson(String source) => Metadata.fromMap(json.decode(source) as Map<String, dynamic>);
}
