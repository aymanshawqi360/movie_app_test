import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'themes_state.dart';

class ThemesCubit extends Cubit<ThemeMode> {
  ThemesCubit() : super(ThemeMode.system);

  void toggleTheme(ThemeMode newTheme) {
    emit(newTheme);
  }
}
