import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:splitmoney/utils/icon_button_sample.dart';
import 'package:splitmoney/widgets/app_bar_sample.dart';
import 'package:splitmoney/widgets/mini_container.dart';

class GroupSettingsPage extends StatelessWidget {
  const GroupSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: AppBarSample(
            title: "Group Settings",
            leading: IconButtonSample(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icons.close),
          ),
        ),
        body: Column(
          children: [
            Container(height: 1, color: Colors.grey[400]),
            const SizedBox(height: 7),
            ListTile(
              leading: MiniContainer(
                child: IconButtonSample(
                  icon: Icons.group,
                  onPressed: () {},
                ),
              ),
              title: const Text("Group Name"),
              subtitle: const Text("Type"),
              trailing: IconButtonSample(onPressed: () {}, icon: Icons.edit),
            ),
            const SizedBox(height: 7),
            Container(height: 1, color: Colors.grey[400]),
            const SizedBox(height: 7),
            ListTile(
              onTap: () {},
              iconColor: Colors.red[300],
              textColor: Colors.red[300],
              leading: const Icon(Icons.logout),
              title: const Text(
                "Leave Group",
              ),
            ),
            const SizedBox(height: 5),
            ListTile(
              onTap: () {},
              iconColor: Colors.red[300],
              textColor: Colors.red[300],
              leading: const Icon(Icons.delete_outlined),
              title: const Text(
                "Delete Group",
              ),
            )
          ],
        ),
      ),
    );
  }
}
