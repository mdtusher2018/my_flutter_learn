// crashlytics_service.dart
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

class CrashlyticsService {
  // Initialize Firebase Crashlytics
  static void initialize() {
    if (kDebugMode) return;

    // Global error handling for Flutter errors
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    // Global error handling for platform (native) errors
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true; // Let Firebase Crashlytics handle the error
    };
  }

  // -----------------------------------------------------------------------
  // NOTE FOR FUTURE:
  // If you want to enable Crashlytics logging for handled/non-fatal errors,
  // simply inject CrashlyticsService into this BaseAsyncNotifier and call:
  //
  //     crashlytics.logError(e, st);
  //
  // This will send the error + stacktrace to Firebase Crashlytics as a
  // NON-FATAL event (useful for tracking API failures, parsing issues,
  // and any error caught inside execute()).
  //
  // Do NOT use fatal:true here — only global unhandled exceptions should
  // be fatal. This method is for soft/handled errors only.
  //
  // Integration steps when needed:
  // 1. Add CrashlyticsService to the constructor of BaseAsyncNotifier
  // 2. Pass it from your provider
  // 3. Uncomment the logError(...) call below
  //
  // -----------------------------------------------------------------------
  // crashlytics.logError(e, st);
  // -----------------------------------------------------------------------

  void logError(dynamic error, StackTrace stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  }

  // -----------------------------------------------------------------------
  // NOTE FOR FUTURE — ABOUT logEvent():
  //
  // Use this method to add **breadcrumbs** to Crashlytics. Breadcrumbs are
  // small logs that help you understand what the user was doing BEFORE a
  // crash or non-fatal error happened.
  //
  // Examples of when to call logEvent():
  //   - User navigated to a specific page
  //   - User started a checkout process
  //   - User tapped an important button
  //   - A network request started/finished
  //   - App entered a specific state (loading data, refreshing, etc.)
  //
  // IMPORTANT:
  // - logEvent() does NOT send a crash.
  // - It simply adds context that appears alongside Crash/Non-Fatal reports.
  // - Helps developers reproduce issues by showing the sequence of events.
  //
  // How to use later:
  //     crashlytics.logEvent("User opened Settings page");
  //     crashlytics.logEvent("API request: /login started");
  //
  // Keep breadcrumbs meaningful but not too frequent to avoid noise.
  //
  // -----------------------------------------------------------------------
  void logEvent(String message) {
    FirebaseCrashlytics.instance.log(message);
  }

  void setCustomKey(String key, String value) {
    FirebaseCrashlytics.instance.setCustomKey(key, value);
  }

  void setUserIdentifier(String userId) {
    FirebaseCrashlytics.instance.setUserIdentifier(userId);
  }

  void triggerCrash() {
    FirebaseCrashlytics.instance.crash();
  }
}
