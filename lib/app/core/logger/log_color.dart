import 'package:annoty/app/core//logger/log_level.dart';

/// Supported ANSI colors.
enum Color {
  megenta,
  purple,
  blue,
  lightBlue,
  cyan,
  green,
  yellow,
  orange,
  red,
  extraRed,
  reset,
}

/// Output color for each log level.
Map<LogLevel, String> color = {
  LogLevel.mark: ansi[Color.yellow]!,
  LogLevel.trace: ansi[Color.purple]!,
  LogLevel.debug: ansi[Color.blue]!,
  LogLevel.info: ansi[Color.lightBlue]!,
  LogLevel.success: ansi[Color.green]!,
  LogLevel.warning: ansi[Color.orange]!,
  LogLevel.error: ansi[Color.red]!,
  LogLevel.fatal: ansi[Color.extraRed]!,
};

/// ANSI escape codes.
const Map<Color, String> ansi = {
  Color.megenta: '\x1B[35m',
  Color.purple: '\x1b[38;5;219m',
  Color.blue: '\x1b[38m',
  Color.lightBlue: '\x1b[38;5;117m',
  Color.cyan: '\x1b[36m',
  Color.green: '\x1B[32m',
  Color.yellow: '\x1B[38;5;229m',
  // Color.orange: '\x1b[33;5;67m',
  Color.orange: '\x1b[38;5;216m',
  Color.red: '\x1B[31m',
  Color.extraRed: '\x1b[41;1m\x1b[38;5;16m',
  Color.reset: '\x1b[0m',
};
