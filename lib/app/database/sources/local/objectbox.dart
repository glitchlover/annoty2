import 'package:annoty/app/database/models/annotation.dart';
import 'package:annoty/app/database/models/comment.dart';
import 'package:annoty/app/database/models/resource_model.dart';
import 'package:annoty/app/database/models/tag.dart';
import 'package:annoty/objectbox.g.dart';

class ObjectBoxDB {
  // final ObjectBoxDB objectbox = ObjectBoxDB.create();
  late final Box<ResourceModel> resourceBox;
  late final Box<Annotation> annotationBox;
  late final Box<Comment> commentBox;
  late final Box<Tag> tagBox;
  static late final Store store;
  static final ObjectBoxDB _singleton = ObjectBoxDB._create();

  ObjectBoxDB._create();

  static init() async {
    store = await openStore();
    return _singleton;
  }

  ObjectBoxDB(){
    resourceBox = Box<ResourceModel>(store);
    annotationBox = Box<Annotation>(store);
    tagBox = Box<Tag>(store);
    commentBox = Box<Comment>(store);
  }
}
