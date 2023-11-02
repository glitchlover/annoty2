// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:objectbox/objectbox.dart';

import 'package:annoty/app/database/models/metadata.dart';
import 'package:annoty/app/database/models/resource_model.dart';

@Entity()
class Annotation {
  int id;
  final String text;
  final String keyWords;
  @Property(type: PropertyType.date)
  final DateTime createdDate;
  @Property(type: PropertyType.date)
  final DateTime modifiedDate;
  final ToOne<AnnotationLocation> annoLocation = ToOne<AnnotationLocation>();
  final ToOne<ResourceModel> resource = ToOne<ResourceModel>();
  final ToOne<Metadata> metadata = ToOne<Metadata>();
  final ToMany<Annotation> backlinks = ToMany<Annotation>();

  Annotation({
    required this.id,
    required this.text,
    required this.keyWords,
    required this.createdDate,
    required this.modifiedDate,
  });
}

@Entity()
class AnnotationLocation {
  int id;
  double xOffset;
  double yOffset;
  AnnotationLocation({
    required this.id,
    required this.xOffset,
    required this.yOffset,
  });
}
