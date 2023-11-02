// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:objectbox/objectbox.dart';

import 'package:annoty/app/database/models/annotation.dart';
import 'package:annoty/app/database/models/resource_model.dart';

@Entity()
class Tag {
  int id;
  final String name;
  final int color;
  final ToMany<ResourceModel> resources = ToMany<ResourceModel>();
  final ToMany<Annotation> annotations = ToMany<Annotation>();

  Tag({
    required this.id,
    required this.name,
    required this.color,
  });
}
