import 'package:flutter/material.dart';
import 'package:movie_box_application/app/routes/navigator_library.dart';
import 'package:movie_box_application/app/routes/navigator_routes.dart';
import 'package:movie_box_application/core/models/movie_model.dart';

class NavigatorCustom {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    final routes = NavigateRoutes.values.byName(routeSettings.name!);

    switch (routes) {
      case NavigateRoutes.onboarding:
        return _navigateToNormal(const OnBoardingView());
      case NavigateRoutes.homepage:
        return _navigateToNormal(const HomePage());
      case NavigateRoutes.moviedetails:
        var movieModel = routeSettings.arguments as MovieModel;
        return _navigateToNormal(MovieDetailView(
          id: movieModel.id!,
          url: movieModel.backdropPath == null ? '' : movieModel.backdropPath!,
          rating: movieModel.voteAverage == null
              ? 0
              : movieModel.voteAverage!.toDouble(),
        ));
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
