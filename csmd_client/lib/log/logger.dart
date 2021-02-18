class Logger {
  static void log(LogLevel level, String message) {
    print('[${level.toString().split('.').last}]: $message');
  }

  static void info(String message) {
    log(LogLevel.INFO, message);
  }

  static void warning(String message) {
    log(LogLevel.WARNING, message);
  }

  static void error(String message) {
    log(LogLevel.ERROR, message);
  }
}

enum LogLevel { INFO, WARNING, ERROR }

void main() {
  Logger.info('hui possal derzhu v kurse');
  Logger.warning('hui obossalsa alert!');
  Logger.error('hui sret nam vsem pizda');
}
