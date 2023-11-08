// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeController extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  ThemeMode get lightMode => ThemeMode.light;

  bool get isDarkMode {
    return false; // temporary

    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme() {
    themeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
