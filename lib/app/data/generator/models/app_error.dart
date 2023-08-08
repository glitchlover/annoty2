import 'package:annoty/app/data/generator/enums/error_code.dart';

class AppError {
  final ErrorCode code;
  final String message;

  AppError({required this.code, required this.message});
}