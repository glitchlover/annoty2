import 'dart:io';

import 'package:annoty/app/core/constants/misc/objects.dart';

final Directory kIndexDir = kAppFileService.index;
final Directory kResourceDir = kAppFileService.workingDirectory["Resource"]!;
final Directory kNotesDir = kAppFileService.workingDirectory["Notes"]!;
final File kAnnotationFile = File("$kResourceDir\\annotation.json");
final File kResourceConfigFile = File("$kResourceDir\\annote.config.json");
final File kUserFile = File("$kIndexDir\\User");
final File kAppConfigFile = File("$kIndexDir\\config.json");