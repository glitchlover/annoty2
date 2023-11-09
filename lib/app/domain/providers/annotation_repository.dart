import 'package:annoty/app/database/models/annotation.dart';

abstract class AnnotationRepository {
  Future<List<Annotation>>? getAllAnnotation();
  Future<List<Annotation>>? getFilteredAnnotation(String filePath);
  Future<List<Annotation>> connectAnnotations(Annotation annotation);
  Future<void> saveAnnotation(Annotation annotation, String filePath);
  Future<void> updateAnnotation(Annotation annotation);
  Future<void> deleteAnnotation(Annotation annotation);
}
