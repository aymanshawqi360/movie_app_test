import 'package:flutter/material.dart';
import 'package:movie_app_test/core/util/colors_manager.dart';
import 'package:movie_app_test/core/util/style.dart';

ThemeData getLightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsManager.white,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      toolbarHeight: 80,
      titleTextStyle: TextStyles.font25Medium.copyWith(
        color: ColorsManager.white,
        fontSize: 23,
      ),
      iconTheme: IconThemeData(color: ColorsManager.white),
      backgroundColor: ColorsManager.blue,
      elevation: 0,
    ),
    textTheme: ThemeData.light().textTheme.apply(
      bodyColor: ColorsManager.black,

      displayColor: ColorsManager.black,
    ),
    colorScheme: ColorScheme.light(
      primary: ColorsManager.lightGray,

      brightness: Brightness.light,
    ),
    useMaterial3: true,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: ColorsManager.orange,
      circularTrackColor: ColorsManager.lightGray,
      linearTrackColor: ColorsManager.lightGray,
    ),
  );
}
