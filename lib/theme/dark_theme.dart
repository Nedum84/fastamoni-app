import 'package:fasta_moni_test/theme/colors.dart';
import 'package:flutter/material.dart';

final customDarkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.grey.shade900,
  primaryColor: KColors.PRIMARY,
  colorScheme: const ColorScheme.dark(brightness: Brightness.light),
  iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
  primarySwatch: MaterialColor(0xff933456, colorMapDark),
  textTheme: const TextTheme().copyWith(),
  appBarTheme: const AppBarTheme(color: KColors.SCAFFOLD_BG),
);
