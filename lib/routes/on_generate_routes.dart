import 'package:fasta_moni_test/routes/app_routes.dart';
import 'package:fasta_moni_test/screens/dashboard.dart';
import 'package:fasta_moni_test/screens/edit_profile.dart';
import 'package:fasta_moni_test/screens/login.dart';
import 'package:fasta_moni_test/screens/register.dart';
import 'package:fasta_moni_test/screens/splash.dart';
import 'package:fasta_moni_test/screens/users.dart';
import 'package:flutter/material.dart';

Route getRoute(RouteSettings settings) {
  final String? name = settings.name;

  // splash screen
  if (name == AppRoutes.splash) {
    return buildRoute(const SplashScreen(), settings: settings);
  }

  // auth
  if (name == AppRoutes.register) {
    return buildRoute(const RegisterScreen(), settings: settings);
  }

  if (name == AppRoutes.login) {
    return buildRoute(const LoginScreen(), settings: settings);
  }

  if (name == AppRoutes.dashboard) {
    return buildRoute(const DashboardScreen(), settings: settings);
  }

  if (name == AppRoutes.editUser) {
    return buildRoute(const EditProfileScreen(), settings: settings);
  }

  if (name == AppRoutes.users) {
    return buildRoute(const UsersScreen(), settings: settings);
  }

  return buildRoute(const DashboardScreen(), settings: settings);
}

MaterialPageRoute buildRoute(Widget child, {RouteSettings? settings}) => MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => child,
    );
