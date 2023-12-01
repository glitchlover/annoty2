// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:annoty/app/database/models/annotation_bounds.dart';
import 'package:annoty/app/database/models/tag.dart';
import 'package:annoty/app/domain/functions/annotation_usecase.dart';
import 'package:objectbox/objectbox.dart';
import 'package:annoty/app/core/resources/enum/highlight.dart';
import 'package:annoty/app/core/resources/logger/logger.dart';
import 'package:annoty/app/database/models/comment.dart';
import 'package:annoty/app/database/models/resource_model.dart';

@Entity()
class Annotation {
  int? id;
  final String text;
  final String keyWords;
  @Transient()
  Highlight color;
  @Property(type: PropertyType.date)
  final DateTime createdDate;
  @Property(type: PropertyType.date)
  final DateTime modifiedDate;
  final int page;
  final ToOne<AnnotationBounds> bounds = ToOne<AnnotationBounds>();
  final ToOne<Comment> comment = ToOne<Comment>();
  final ToOne<ResourceModel> resource = ToOne<ResourceModel>();
  final ToMany<Annotation> outlinks = ToMany<Annotation>();
  final ToMany<Tag> tag = ToMany<Tag>();

  Future<List<Annotation>?> get inlinks =>
      AnnotationUseCase().getOutlinkedAnnotations(this);

  // Future<List<Annotation>> get links async => (await AnnotationUseCase().getOutlinkedAnnotations()).addAll(await inlinks);

  Annotation({
    this.id,
    required this.text,
    required this.keyWords,
    required this.createdDate,
    required this.modifiedDate,
    required this.page,
    this.color = Highlight.unknown,
  });

  int get dbColor {
    // _ensureStableEnumValues();
    return color.index;
  }

  set dbColor(int value) {
    _ensureStableEnumValues(value);
    color = Highlight.values[value];
  }

  void _ensureStableEnumValues(int value) {
    assert(0 <= value && value <= 7);
    Flog.debug(mapHighlightToName[value]);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'text': text,
      'keyWords': keyWords,
      'color': mapNameToHighlight[color],
      'createdDate': createdDate.millisecondsSinceEpoch,
      'modifiedDate': modifiedDate.millisecondsSinceEpoch,
      'page': page,
    };
  }

  factory Annotation.fromMap(Map<String, dynamic> map) {
    return Annotation(
      id: map['id'] as int,
      text: map['text'] as String,
      keyWords: map['keyWords'] as String,
      color: mapNameToHighlight['color'] as Highlight,
      createdDate:
          DateTime.fromMillisecondsSinceEpoch(map['createdDate'] as int),
      modifiedDate:
          DateTime.fromMillisecondsSinceEpoch(map['modifiedDate'] as int),
      page: map['page'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Annotation.fromJson(String source) =>
      Annotation.fromMap(json.decode(source) as Map<String, dynamic>);
}
