import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class AppAnalyticsObserver extends NavigatorObserver {
  final FirebaseAnalytics analytics;

  AppAnalyticsObserver(this.analytics);

  @override
  void didPush(Route route, Route? previousRoute) {
    if (route.settings.name != null) {
      analytics.logScreenView(screenName: route.settings.name!);
    }
    super.didPush(route, previousRoute);
  }
}
