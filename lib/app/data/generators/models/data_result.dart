import 'package:annoty/app/data/generators/models/app_error.dart';

class DataResult<T> {
  final T? data;
  final AppError? error;

  DataResult({this.data, this.error});
}
