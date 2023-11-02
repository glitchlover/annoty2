import 'package:annoty/app/database/models/resource_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Metadata {
  int id;

  final List<String>? authours;
  final String? publisher;
  @Property(type: PropertyType.date)
  final DateTime? published;
  final ToOne<ResourceModel> resource = ToOne<ResourceModel>();

  Metadata({
    required this.id,
    this.authours,
    this.published,
    this.publisher,
  });
}