import 'package:flutter/material.dart';
import 'package:movie_app_test/core/routing/app_route.dart';
import 'package:movie_app_test/core/routing/routes.dart';

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData(primarySwatch: Colors.indigo),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouting.onGenerateRoute,
      initialRoute: Routes.moviesScreen,
    );
  }
}
