// ignore_for_file: use_build_context_synchronously

import 'package:fasta_moni_test/app_layouts/app_layout.dart';
import 'package:fasta_moni_test/provider/user_provider.dart';
import 'package:fasta_moni_test/services/user_service.dart';
import 'package:fasta_moni_test/widget/solid_button.dart';
import 'package:fasta_moni_test/widget/text_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool isSubmitting = false;
  String? errMsg;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  _onSubmit() async {
    _setErr(null);
    final name = nameController.text.trim();
    // final email = emailController.text.trim();

    if (name.isEmpty) {
      return _setErr('Name is required');
    }

    if (name.split(' ').length < 2) {
      return _setErr('Enter full name');
    }

    setState(() => isSubmitting = true);
    final result = await UserService.update(name);

    if (result.error != null && result.error!.errorOccured()) {
      setState(() => isSubmitting = false);
      return _setErr(result.error?.message ?? 'An error occurred, try again!');
    }

    Provider.of<UserProvider>(context, listen: false).setUser(result.data);
    Navigator.of(context).pop();
  }

  _setErr(String? err) {
    setState(() {
      errMsg = err;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<UserProvider?>();

    return AppLayout(
      title: 'Edit Profile',
      padding: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (errMsg != null)
            Text(
              errMsg!,
              style: TextStyle(
                color: Colors.red.shade700,
              ),
            ),
          const SizedBox(height: 12),
          TextInput(
            controller: nameController..text = controller?.user?.name ?? "",
            label: 'Name',
            hintText: 'Enter full name',
            enabled: !isSubmitting,
            textInputType: TextInputType.name,
          ),
          const SizedBox(height: 16),
          SolidButton(
            loading: isSubmitting,
            onClick: () => _onSubmit(),
            text: 'Submit',
          ),
        ],
      ),
    );
  }
}
