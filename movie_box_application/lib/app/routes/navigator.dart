import 'package:flutter/material.dart';
import 'package:movie_box_application/app/routes/navigator_library.dart';
import 'package:movie_box_application/app/routes/navigator_routes.dart';
import 'package:movie_box_application/app/views/homepage/home_page.dart';


class NavigatorCustom {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    final routes = NavigateRoutes.values.byName(routeSettings.name!);

    switch (routes) {
      case NavigateRoutes.onboarding:
        return _navigateToNormal(const OnBoardingView());
      case NavigateRoutes.homepage:
        return _navigateToNormal(const HomePage());
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
