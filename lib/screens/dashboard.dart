import 'package:fasta_moni_test/app_layouts/app_layout.dart';
import 'package:fasta_moni_test/provider/user_provider.dart';
import 'package:fasta_moni_test/routes/app_routes.dart';
import 'package:fasta_moni_test/widget/outline_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  _item(String label, String? value) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        const SizedBox(width: 12),
        Text(value ?? "N/A"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<UserProvider?>();

    return AppLayout(
      title: 'Home',
      showBackBtn: false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            onPressed: () => Navigator.of(context).pushNamed(AppRoutes.editUser),
            icon: const Icon(
              Icons.edit,
              size: 24,
            ),
          ),
        ),
      ],
      padding: 16,
      child: ListView(
        children: [
          const SizedBox(height: 12),
          if (controller?.user?.avatar != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(180),
                  child: Image.network(
                    controller!.user!.avatar,
                    width: 100,
                    height: 100,
                  ),
                ),
              ],
            ),
          const SizedBox(height: 12),
          _item('ID:', "${controller?.user?.id}"),
          const SizedBox(height: 12),
          _item('Name:', controller?.user?.name ?? "N/A"),
          const SizedBox(height: 12),
          _item('Email:', controller?.user?.email ?? "N/A"),
          const SizedBox(height: 32),
          OutlineButton(
            onClick: () => Navigator.of(context).pushNamed(AppRoutes.users),
            text: 'View Users',
          ),
        ],
      ),
    );
  }
}
