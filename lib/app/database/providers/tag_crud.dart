import 'package:annoty/app/database/models/tag.dart';
import 'package:annoty/app/domain/providers/tag_repository.dart';

class TagCrud implements TagRepository{
  @override
  Future<void> deleteTag(Tag tag) {
    // TODO: implement deleteTag
    throw UnimplementedError();
  }

  @override
  Future<List<Tag>> getTag() {
    // TODO: implement getTag
    throw UnimplementedError();
  }

  @override
  Future<void> addTag(Tag tag) {
    // TODO: implement saveTag
    throw UnimplementedError();
  }

  @override
  Future<void> updateTag(Tag tag) {
    // TODO: implement updateTag
    throw UnimplementedError();
  }
}