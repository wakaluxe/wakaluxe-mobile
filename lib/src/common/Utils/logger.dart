import 'package:logger/logger.dart';

void logDebug(dynamic msg) {
  final logger = Logger();

  logger.d(msg);
}

void logError(dynamic msg) {
  final logger = Logger();

  logger.e(msg);
}

void logInfo(dynamic msg) {
  final logger = Logger();

  logger.i(msg);
}

void logWarning(dynamic msg) {
  final logger = Logger();

  logger.w(msg);
}

void logWTF(dynamic msg) {
  final logger = Logger();

  logger.wtf(msg);
}

void logVerbose(dynamic msg) {
  final logger = Logger();

  logger.v(msg);
}