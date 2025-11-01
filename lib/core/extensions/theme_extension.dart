import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  bool get isDartMode => Theme.of(this).brightness == Brightness.dark;
}
