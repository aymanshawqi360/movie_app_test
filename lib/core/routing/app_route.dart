import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_test/core/di/dependency_injection.dart';
import 'package:movie_app_test/core/routing/routes.dart';
import 'package:movie_app_test/features/home/doman/entities/movie_entity.dart';
import 'package:movie_app_test/features/home/presentation/cubit/home_cubit.dart';
import 'package:movie_app_test/features/home/presentation/screen/movies_view.dart';
import 'package:movie_app_test/features/home/presentation/widget/movie_details_screen.dart';

class AppRouting {
  AppRouting._();
  static Route onGenerateRoute(RouteSettings routeSettings) {
    final reouteArguments = routeSettings.arguments;
    switch (routeSettings.name) {
      case Routes.moviesScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<HomeCubit>()..movieState(isRefrash: false),
            child: const MoviesView(),
          ),
        );
      case Routes.movieDetails:
        return MaterialPageRoute(
          builder: (_) =>
              MovieDetailsScreen(movieEntity: reouteArguments as MovieEntity),
        );

      default:
        return defaultPage();
    }
  }

  static MaterialPageRoute<dynamic> defaultPage() =>
      MaterialPageRoute(builder: (_) => Scaffold(body: Text("data")));
}
