import 'package:flutter/material.dart';
import 'package:movie_app_test/core/di/dependency_injection.dart';
import 'package:movie_app_test/core/networking/hive_service.dart';
import 'package:movie_app_test/movies_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  await HiveService.init();

  runApp(MoviesApp());
}
