import 'package:fasta_moni_test/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final customLightTheme = ThemeData(
  scaffoldBackgroundColor: KColors.SCAFFOLD_BG,
  primaryColor: KColors.PRIMARY,
  primaryColorLight: Colors.white,
  dividerTheme: const DividerThemeData(
    color: Color(0xffF6F6F6),
    thickness: 1,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Color(0xff0D1F2D),
  ),
  colorScheme: const ColorScheme.light(brightness: Brightness.light),
  iconTheme: const IconThemeData(color: KColors.TEXT, size: 16),
  primarySwatch: MaterialColor(0xff933456, colorMapLight),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: KColors.PRIMARY,
    circularTrackColor: KColors.SCAFFOLD_BG.withOpacity(.5),
  ),
  textTheme: const TextTheme().copyWith(
    titleLarge: const TextStyle(
      fontSize: 16,
    ),
    headlineSmall: const TextStyle(
      color: Color(0xff0D1F2D),
    ),
    bodyLarge: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: KColors.TEXT,
    ),
    bodyMedium: const TextStyle(
      color: KColors.TEXT,
      fontSize: 16,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    // fillColor: KColors.INPUT_BG,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: KColors.INPUT_BORDER),
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: KColors.INPUT_BORDER),
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
    border: InputBorder.none,
    errorStyle: TextStyle(color: KColors.PRIMARY, height: 0.7),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: KColors.PRIMARY),
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: KColors.PRIMARY),
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: KColors.TEXT_VERY_LIGHT),
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
    hintStyle: TextStyle(color: KColors.TEXT_LIGHT),
    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: false,
    iconTheme: IconThemeData(
      color: KColors.TEXT,
    ),
    titleTextStyle: TextStyle(
      fontSize: 24,
      color: KColors.TEXT,
      fontWeight: FontWeight.w600,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
    backgroundColor: KColors.SCAFFOLD_BG,
    shadowColor: Color(0xffF6F6F6),
    elevation: 1,
  ),
);
