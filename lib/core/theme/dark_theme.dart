import 'package:flutter/material.dart';
import 'package:movie_app_test/core/util/colors_manager.dart';

ThemeData getDarkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsManager.black,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      toolbarHeight: 80,
      centerTitle: true,
      backgroundColor: ColorsManager.gray6,
      titleTextStyle: TextStyle(
        color: ColorsManager.turquoise,
        fontSize: 25,
        fontWeight: FontWeight.w500,
      ),
      iconTheme: IconThemeData(color: ColorsManager.turquoise),
      elevation: 0,
    ),
    textTheme: ThemeData.dark().textTheme.apply(
      bodyColor: ColorsManager.white,

      displayColor: ColorsManager.white,
    ),

    // textTheme: TextTheme(
    //   bodyLarge: TextStyle(color: ColorsManager.white),
    //   // bodyMedium:
    //   titleLarge: TextStyle(color: ColorsManager.turquoise),
    // ),
    colorScheme: ColorScheme.dark(
      primary: ColorsManager.gray6,

      brightness: Brightness.dark,
    ),
    useMaterial3: true,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: ColorsManager.orange,
      circularTrackColor: ColorsManager.lightGray,
      linearTrackColor: ColorsManager.lightGray,
    ),
  );
}
