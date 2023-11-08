// ignore_for_file: use_build_context_synchronously

import 'package:fasta_moni_test/app_layouts/app_layout.dart';
import 'package:fasta_moni_test/provider/user_provider.dart';
import 'package:fasta_moni_test/routes/app_routes.dart';
import 'package:fasta_moni_test/services/auth_service.dart';
import 'package:fasta_moni_test/validations/validation.dart';
import 'package:fasta_moni_test/widget/outline_button.dart';
import 'package:fasta_moni_test/widget/password_input.dart';
import 'package:fasta_moni_test/widget/solid_button.dart';
import 'package:fasta_moni_test/widget/text_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final controller = Provider.of<UserProvider>(context);

  bool isSubmitting = false;
  String? errMsg;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  _onSubmit() async {
    _setErr(null);
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (!Validation.isEmail(email)) {
      return _setErr('Enter a valid email address');
    }

    if (password.isEmpty) {
      return _setErr('Password is required');
    }

    setState(() => isSubmitting = true);
    final result = await AuthService.login(email, password);

    if (result.error != null && result.error!.errorOccured()) {
      setState(() => isSubmitting = false);
      return _setErr(result.error?.message ?? 'An error occurred, try again!');
    }

    Provider.of<UserProvider>(context, listen: false).setUser(result.data);
    Navigator.pushNamedAndRemoveUntil(context, AppRoutes.dashboard, ModalRoute.withName(AppRoutes.dashboard));
  }

  _setErr(String? err) {
    setState(() {
      errMsg = err;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      title: '',
      showHeader: false,
      padding: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Login to Your Account',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          if (errMsg != null)
            Text(
              errMsg!,
              style: TextStyle(
                color: Colors.red.shade700,
              ),
            ),
          const SizedBox(height: 12),
          TextInput(
            controller: emailController,
            label: 'Email Address',
            hintText: 'Enter email',
            enabled: !isSubmitting,
            textInputType: TextInputType.emailAddress,
          ),
          PasswordInput(
            controller: passwordController,
            label: 'Password',
            hintText: '•••••••',
            enabled: !isSubmitting,
          ),
          const SizedBox(height: 16),
          SolidButton(
            loading: isSubmitting,
            onClick: () => _onSubmit(),
            text: 'Login',
          ),
          const SizedBox(height: 16),
          OutlineButton(
            onClick: () => Navigator.of(context).pushReplacementNamed(AppRoutes.register),
            text: "Don't have account? Register",
            borderColor: Colors.transparent,
          ),
        ],
      ),
    );
  }
}
