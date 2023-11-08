import 'package:fasta_moni_test/provider/user_provider.dart';
import 'package:fasta_moni_test/routes/app_routes.dart';
import 'package:fasta_moni_test/routes/on_generate_routes.dart';
import 'package:fasta_moni_test/theme/controller.dart';
import 'package:fasta_moni_test/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeController()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      // final value = context.watch<int?>();
      child: MaterialApp(
        title: 'FastaMoni',
        debugShowCheckedModeBanner: false,
        // themeMode: themeController.themeMode,
        themeMode: context.watch<ThemeController?>()?.lightMode,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        initialRoute: AppRoutes.splash,
        onGenerateRoute: (route) => getRoute(route),
      ),
    );
  }
}
