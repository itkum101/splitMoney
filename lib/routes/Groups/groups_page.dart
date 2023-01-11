import 'package:flutter/material.dart';

//Import Routes
import 'package:splitmoney/routes/Groups/add_group.dart';
import 'package:splitmoney/routes/Groups/groups_page_display_list.dart';

//Import Widgets
import 'package:splitmoney/widgets/app_bar_sample.dart';

//Import Utils
import 'package:splitmoney/utils/icon_button_sample.dart';
import 'package:splitmoney/utils/sample_floating_action_button.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      floatingActionButton: const SampleFloatingActionButton(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarSample(
          actions: [
            IconButtonSample(onPressed: () {}, icon: Icons.search),
            const SizedBox(
              width: 7,
            ),
            IconButtonSample(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return const AddGroup();
                  })));
                },
                icon: Icons.group_add)
          ],
        ),
      ),
      body: const GroupsPageDisplayList(),
    );
  }
}
