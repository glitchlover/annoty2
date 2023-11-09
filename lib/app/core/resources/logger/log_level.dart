/// Supported log levels.
enum LogLevel {
  mark,
  trace,
  debug,
  info,
  success,
  warning,
  error,
  fatal,
}

/// Value of each log level.
const Map<LogLevel, int> number = {
  LogLevel.mark: 100,
  LogLevel.trace: 200,
  LogLevel.debug: 300,
  LogLevel.info: 400,
  LogLevel.success: 500,
  LogLevel.warning: 750,
  LogLevel.error: 1000,
  LogLevel.fatal: 2000,
};

/// Header symbol for each log level.
const Map<LogLevel, String> symbol = {
  LogLevel.mark: '\u2192', // Rightwards arrow.
  LogLevel.trace: '\u2192', // Rightwards arrow.
  LogLevel.debug: '\u2192', // Rightwards arrow.
  LogLevel.info: '\u2139', // Information source.
  LogLevel.success: '\u2713', // Check mark.
  LogLevel.warning: '!', // Exclamation point.
  LogLevel.error: '\u2718', // Heavy ballot X.
  LogLevel.fatal: '\u2718', // Heavy ballot X.
};

const Map<LogLevel, String> emoji = {
  LogLevel.mark: '⭐', // Rightwards arrow.
  LogLevel.trace: '🔎', // Rightwards arrow.
  LogLevel.debug: '🐛', // Rightwards arrow.
  LogLevel.info: '💭', // Information source.
  LogLevel.success: '✅', // Check mark.
  LogLevel.warning: '☢️', // Exclamation point.
  LogLevel.error: '⛔', // Heavy ballot X.
  LogLevel.fatal: '💀', 
};
