// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:annoty/app/database/models/annotation_bounds.dart';
import 'package:objectbox/objectbox.dart';

import 'package:annoty/app/core/resources/enum/color.dart';
import 'package:annoty/app/core/resources/logger/logger.dart';
import 'package:annoty/app/database/models/comment.dart';
import 'package:annoty/app/database/models/resource_model.dart';

@Entity()
class Annotation {
  int? id;
  final String text;
  final String keyWords;
  @Transient()
  AnnoColor color;
  @Property(type: PropertyType.date)
  final DateTime createdDate;
  @Property(type: PropertyType.date)
  final DateTime modifiedDate;
  final ToOne<AnnotationBounds> bounds = ToOne<AnnotationBounds>();
  final ToOne<Comment> comment = ToOne<Comment>();
  final ToOne<ResourceModel> resource = ToOne<ResourceModel>();
  final ToMany<Annotation> backlinks = ToMany<Annotation>();

  Annotation({
    this.id,
    required this.text,
    required this.keyWords,
    required this.createdDate,
    required this.modifiedDate,
    this.color = AnnoColor.unknown,
  });

  int get dbColor {
    // _ensureStableEnumValues();
    return color.index;
  }

  set dbColor(int value) {
    _ensureStableEnumValues(value);
    color = AnnoColor.values[value];
  }

  void _ensureStableEnumValues(int value) {
    assert(0 <= value && value <= 7);
    Flog.debug(mapToName[value]);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'text': text,
      'keyWords': keyWords,
      'color': mapToAnnoColor[color],
      'createdDate': createdDate.millisecondsSinceEpoch,
      'modifiedDate': modifiedDate.millisecondsSinceEpoch,
    };
  }

  factory Annotation.fromMap(Map<String, dynamic> map) {
    return Annotation(
      id: map['id'] as int,
      text: map['text'] as String,
      keyWords: map['keyWords'] as String,
      color: mapToAnnoColor['color'] as AnnoColor,
      createdDate:
          DateTime.fromMillisecondsSinceEpoch(map['createdDate'] as int),
      modifiedDate:
          DateTime.fromMillisecondsSinceEpoch(map['modifiedDate'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Annotation.fromJson(String source) =>
      Annotation.fromMap(json.decode(source) as Map<String, dynamic>);
}
