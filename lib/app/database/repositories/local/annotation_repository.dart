import 'package:annoty/app/core/resources/enum/highlight.dart';
import 'package:annoty/app/database/models/annotation.dart';
import 'package:annoty/app/database/models/annotation_bounds.dart';
import 'package:annoty/app/database/models/comment.dart';
import 'package:annoty/app/database/models/tag.dart';
import 'package:annoty/app/database/repositories/local/resource_repository.dart';
import 'package:annoty/app/database/sources/local/objectbox.dart';
import 'package:annoty/app/domain/repositories/annotation_repository.dart';
import 'package:annoty/objectbox.g.dart';

class LocalAnnotatonRepository extends AnnotationRepository {
  final Box annotationBox = ObjectBoxDB().annotationBox;

  @override
  Future<List<Annotation>> getResourceFilteredAnnotation(
      String filePath) async {
    QueryBuilder<dynamic> unbuilded = annotationBox.query();
    unbuilded.link(Annotation_.resource,
        ResourceModel_.filePath.equals(filePath, caseSensitive: true));
    return unbuilded.build().findAsync() as Future<List<Annotation>>;
  }

  Future<List<Annotation>> getAnnotaitonFilteredAnnotations(
          Annotation annotation) async =>
      annotation.outlinks;

  // Future<List<Annotation>> getOutlinkedAnnotation(Annotation annotation) =>
  //   return annotationBox

  @override
  Future<List<Annotation>> getAllAnnotation() =>
      annotationBox.getAllAsync() as Future<List<Annotation>>;

  @override
  Future<Annotation> addAnnotation(
      Annotation annotation, filePath, AnnotationBounds bounds) async {
    annotation.resource.target =
        await LocalResourceRepository().getResource(filePath);
    annotation.bounds.target = bounds;
    return annotationBox.putAndGetAsync(annotation) as Future<Annotation>;
  }

  // @override
  // Future<List<Annotation>> getResourceAnnotation(ResourceModel resource) =>
  //     annotationBox.getAllAsync() as Future<List<Annotation>>;

  // @override
  // Future<Annotation> saveAnnotation(Annotation annotation) =>
  //     annotationBox.putAndGetAsync(annotation) as Future<Annotation>;

  @override
  Future<List<Annotation>> connectAnnotations(Annotation annotation) {
    // TODO: implement connectAnnotations
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAnnotation(Annotation annotation) async {
    await annotationBox.removeAsync(annotation.id!);
  }

  @override
  Future<void> updateAnnotation(Annotation annotation) =>
      annotationBox.putAsync(annotation, mode: PutMode.update);

  Future<void> updateColor(Highlight color) {
    // TODO: implement updateAnnotation
    throw UnimplementedError();
  }

  Future<void> assignTagToAnnotation(Tag tag) {
    // TODO: implement updateAnnotation
    throw UnimplementedError();
  }

  Future<void> removeTag(Tag tag) {
    // TODO: implement updateAnnotation
    throw UnimplementedError();
  }

  Future<void> assignComment(Comment comment) {
    // TODO: implement updateAnnotation
    throw UnimplementedError();
  }

  Future<void> removeComment(Comment comment) {
    // TODO: implement updateAnnotation
    throw UnimplementedError();
  }
}
