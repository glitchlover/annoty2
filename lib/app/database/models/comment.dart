// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';
import 'package:objectbox/objectbox.dart';

@Entity()
class Comment {
  int? id;
  final String text;
  @Property(type: PropertyType.date)
  final DateTime createdDate;
  @Property(type: PropertyType.date)
  final DateTime modifiedDate;
  Comment({
    this.id,
    required this.text,
    required this.createdDate,
    required this.modifiedDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'text': text,
      'createdDate': createdDate.millisecondsSinceEpoch,
      'modifiedDate': modifiedDate.millisecondsSinceEpoch,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      id: map['id'] != null ? map['id'] as int : null,
      text: map['text'] as String,
      createdDate: DateTime.fromMillisecondsSinceEpoch(map['createdDate'] as int),
      modifiedDate: DateTime.fromMillisecondsSinceEpoch(map['modifiedDate'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) => Comment.fromMap(json.decode(source) as Map<String, dynamic>);
}
