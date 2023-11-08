// ignore_for_file: use_build_context_synchronously

import 'package:fasta_moni_test/app_layouts/app_layout.dart';
import 'package:fasta_moni_test/routes/app_routes.dart';
import 'package:fasta_moni_test/theme/colors.dart';
import 'package:fasta_moni_test/utils/asset_images.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _init();
  }

  _init() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login, ModalRoute.withName(AppRoutes.login));
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      title: '',
      showHeader: false,
      statusBgColor: KColors.SCAFFOLD_BG,
      child: Container(
        alignment: Alignment.center,
        child: Image.asset(
          AssetImages.LOGO,
          width: 100,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
