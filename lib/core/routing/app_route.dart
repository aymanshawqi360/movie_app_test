import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_test/core/di/dependency_injection.dart';
import 'package:movie_app_test/core/routing/routes.dart';
import 'package:movie_app_test/features/home/presentation/cubit/home_cubit.dart';
import 'package:movie_app_test/features/home/presentation/screen/movies_view.dart';

class AppRouting {
  AppRouting._();
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.moviesScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<HomeCubit>()..movieState(isRefrash: false),
            child: const MoviesView(),
          ),
        );

      default:
        return defaultPage();
    }
  }

  static MaterialPageRoute<dynamic> defaultPage() =>
      MaterialPageRoute(builder: (_) => Scaffold(body: Text("data")));
}
