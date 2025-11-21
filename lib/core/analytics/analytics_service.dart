import 'package:firebase_analytics/firebase_analytics.dart';
import 'analytics_events.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  Future<void> logEvent(AnalyticsEvent event, {Map<String, Object>? params}) {
    return _analytics.logEvent(name: event.name, parameters: params);
  }

  Future<void> setUserId(String? userId) {
    return _analytics.setUserId(id: userId);
  }

  Future<void> setUserProperty(String name, String value) {
    return _analytics.setUserProperty(name: name, value: value);
  }
}
