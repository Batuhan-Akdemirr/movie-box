import 'package:flutter/material.dart';
import 'package:movie_box_application/routes/navigator_library.dart';
import 'package:movie_box_application/routes/navigator_routes.dart';


class NavigatorCustom {
 static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    final routes = NavigateRoutes.values.byName(routeSettings.name!);

    switch (routes) {
      case NavigateRoutes.onboarding:
        return _navigateToNormal(const OnboardingView());
    }
  }

  static Route<dynamic>? _navigateToNormal(Widget child) {
    return MaterialPageRoute(
      builder: (context) {
        return child;
      },
    );
  }
}
