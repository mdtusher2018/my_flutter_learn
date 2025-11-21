enum AnalyticsEvent { appOpen, login, logout, viewProduct, addToCart }

extension AnalyticsEventName on AnalyticsEvent {
  String get name {
    switch (this) {
      case AnalyticsEvent.appOpen:
        return "app_open";
      case AnalyticsEvent.login:
        return "login";
      case AnalyticsEvent.logout:
        return "logout";
      case AnalyticsEvent.viewProduct:
        return "view_product";
      case AnalyticsEvent.addToCart:
        return "add_to_cart";
    }
  }
}
