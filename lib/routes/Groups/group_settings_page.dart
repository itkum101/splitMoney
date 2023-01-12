import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitmoney/data/group_data.dart';
import 'package:splitmoney/models/group_model.dart';
import 'package:splitmoney/provider/group_name_provider.dart';
import 'package:splitmoney/utils/icon_button_sample.dart';
import 'package:splitmoney/utils/sample_elevated_button.dart';
import 'package:splitmoney/widgets/alert_dialog_box.dart';
import 'package:splitmoney/widgets/app_bar_sample.dart';
import 'package:splitmoney/widgets/mini_container.dart';

class GroupSettingsPage extends StatefulWidget {
  int index;
  final String groupName;
  Widget? imgChild;
  GroupSettingsPage(
      {super.key, required this.groupName, this.imgChild, required this.index});

  @override
  State<GroupSettingsPage> createState() => _GroupSettingsPageState();
}

class _GroupSettingsPageState extends State<GroupSettingsPage> {
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
                child: widget.imgChild,
              ),
              title: Text(widget.groupName),
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
              onTap: () {
                showDialog(
                    context: context,
                    builder: ((context) {
                      return AlertDialogBox(
                          actions: [
                            Center(
                              child: SampleElevatedButton(
                                  onPressed: () {
                                    Provider.of<GroupNameProvider>(context,
                                            listen: false)
                                        .removeFromList(widget.index);

                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  buttonText: "yes"),
                            ),
                          ],
                          alertText:
                              "Do you want really want to delete group : ${widget.groupName}");
                    }));
              },
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
