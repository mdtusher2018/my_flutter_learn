import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'analytics_service.dart';

final analyticsProvider = Provider<AnalyticsService>((ref) {
  final analytics = AnalyticsService();
  analytics.setUserId("123");
  analytics.setUserProperty("name", "tester");
  analytics.setUserProperty("country", "bangladesh");
  return analytics;
});
