import 'package:flutter/material.dart';
import 'package:movie_app_test/core/routing/routes.dart';
import 'package:movie_app_test/features/home/presentation/screen/movies_view.dart';

class AppRouting {
  AppRouting._();
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.moviesScreen:
        return MaterialPageRoute(builder: (_) => const MoviesView());

      default:
        return defaultPage();
    }
  }

  static MaterialPageRoute<dynamic> defaultPage() =>
      MaterialPageRoute(builder: (_) => Scaffold(body: Text("data")));
}
