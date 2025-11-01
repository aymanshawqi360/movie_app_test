import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_test/core/routing/app_route.dart';
import 'package:movie_app_test/core/routing/routes.dart';
import 'package:movie_app_test/core/theme/cubit/themes_cubit.dart';
import 'package:movie_app_test/core/theme/dark_theme.dart';
import 'package:movie_app_test/core/theme/light_theme.dart';

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesCubit, ThemeMode>(
      builder: (context, state) {
        return MaterialApp(
          darkTheme: getDarkTheme(),
          themeMode: state,
          theme: getLightTheme(),
          themeAnimationDuration: Duration(milliseconds: 500),
          themeAnimationCurve: Curves.easeInOut,

          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouting.onGenerateRoute,
          initialRoute: Routes.moviesScreen,
        );
      },
    );
  }
}
