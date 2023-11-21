import 'package:annoty/app/database/models/annotation.dart';
import 'package:annoty/app/database/models/annotation_bounds.dart';

abstract class AnnotationRepository {
  Future<List<Annotation>>? getAllAnnotation();
  Future<List<Annotation>>? getResourceFilteredAnnotation(String filePath);
  Future<List<Annotation>> connectAnnotations(Annotation annotation);
  Future<void> addAnnotation(
      Annotation annotation, String filePath, AnnotationBounds bounds);
  Future<void> updateAnnotation(Annotation annotation);
  Future<void> deleteAnnotation(Annotation annotation);
}
