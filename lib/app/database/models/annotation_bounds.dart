import 'dart:convert';

import 'package:objectbox/objectbox.dart';

@Entity()
class AnnotationBounds {
  int? id;
  final double xOffset1;
  final double xOffset2;
  final double yOffset1;
  final double yOffset2;
  AnnotationBounds({
    this.id,
    required this.xOffset1,
    required this.xOffset2,
    required this.yOffset1,
    required this.yOffset2,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'xOffset1': xOffset1,
      'xOffset2': xOffset2,
      'yOffset1': yOffset1,
      'yOffset2': yOffset2,
    };
  }

  factory AnnotationBounds.fromMap(Map<String, dynamic> map) {
    return AnnotationBounds(
      id: map['id'] != null ? map['id'] as int : null,
      xOffset1: map['xOffset1'] as double,
      xOffset2: map['xOffset2'] as double,
      yOffset1: map['yOffset1'] as double,
      yOffset2: map['yOffset2'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnnotationBounds.fromJson(String source) =>
      AnnotationBounds.fromMap(json.decode(source) as Map<String, dynamic>);
}
