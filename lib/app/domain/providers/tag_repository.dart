import 'package:annoty/app/database/models/tag.dart';

abstract class TagRepository {
  Future<List<Tag>> getTag();
  Future<void> addTag(Tag tag);
  Future<void> updateTag(Tag tag);
  Future<void> deleteTag(Tag tag);
}
