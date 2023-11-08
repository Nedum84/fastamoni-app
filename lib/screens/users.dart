import 'package:fasta_moni_test/app_layouts/app_layout.dart';
import 'package:fasta_moni_test/models/user.dart';
import 'package:fasta_moni_test/services/custom/server_response.dart';
import 'package:fasta_moni_test/services/user_service.dart';
import 'package:fasta_moni_test/theme/colors.dart';
import 'package:fasta_moni_test/widget/outline_button.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<User> items = [];
  int total = 0;
  int page = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      title: 'Fastamoni Users',
      child: FutureBuilder<GetManyResponse<User>?>(
        future: UserService.findAll(page: page),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          total = snapshot.data?.total ?? 0;
          items.addAll(snapshot.data?.data ?? []);

          final ids = <dynamic>{};
          items.retainWhere((x) => ids.add(x.id));

          return RefreshIndicator(
            onRefresh: () {
              return Future(() => setState(() => items = []));
            },
            color: KColors.PRIMARY,
            strokeWidth: 3,
            child: ListView.separated(
              key: const PageStorageKey<String>('users'),
              itemCount: items.length + 1,
              itemBuilder: (context, index) {
                // for last item
                if (index == items.length) {
                  // if not yet the total item, show loading progress
                  if (items.length != total && snapshot.connectionState != ConnectionState.waiting) {
                    return OutlineButton(
                      onClick: () => setState(() => page = page + 1),
                      text: 'See more',
                      borderColor: Colors.transparent,
                    );
                  }
                  return const SizedBox();
                }

                return _item(items[index]);
              },
              separatorBuilder: (context, index) => Divider(color: Colors.grey.shade200, height: 1),
            ),
          );
        },
      ),
    );
  }
}

_item(User user) {
  return Container(
    padding: const EdgeInsets.all(16),
    width: double.infinity,
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.network(
            user.avatar,
            width: 44,
            height: 44,
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user.name),
            const SizedBox(height: 6),
            Text(
              user.email,
              style: const TextStyle(
                fontSize: 14,
                color: KColors.TEXT_LIGHT,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
