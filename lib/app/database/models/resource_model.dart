import 'package:annoty/app/database/models/metadata.dart';
import 'package:annoty/app/database/models/tag.dart';
import 'package:objectbox/objectbox.dart';

import 'package:annoty/app/database/models/annotation.dart';

@Entity()
class ResourceModel {
  int id;
  final String name;
  final String customName;
  final String filePath;
  @Property(type: PropertyType.date)
  final DateTime createdDate;
  @Property(type: PropertyType.date)
  final DateTime modifiedDate;
  final ToOne<Metadata> metadata = ToOne<Metadata>();
  final ToMany<Annotation> annotations = ToMany<Annotation>();
  final ToMany<Tag>? tags = ToMany<Tag>();

  ResourceModel({
      required this.id,
      required this.name,
      required this.customName,
      required this.filePath,
      required this.createdDate,
      required this.modifiedDate,
      });
}
