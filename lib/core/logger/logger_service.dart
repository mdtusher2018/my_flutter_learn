import 'package:flutter/foundation.dart';

class LoggerService {
  static void log(String message, {String? tag}) {
    if (!kReleaseMode) {
      // Only log in debug mode
      final t = tag != null ? '[$tag] ' : '';
      print('$t$message');
    }
  }

  static void error(String message, {String? tag}) {
    if (!kReleaseMode) {
      final t = tag != null ? '[$tag] ' : '';
      print('❌ $t$message');
    }

  }
}
