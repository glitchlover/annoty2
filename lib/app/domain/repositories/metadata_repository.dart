import 'package:annoty/app/database/models/metadata.dart';

abstract class MetadataRepository {
  Future<List<Metadata>> getMetadata();
  Future<void> saveMetadata(Metadata metadata);
  Future<void> updateMetadata(Metadata metadata);
  Future<void> deleteMetadata(Metadata metadata);
}
