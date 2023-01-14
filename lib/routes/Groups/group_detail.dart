import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitmoney/models/group_model.dart';
import 'package:splitmoney/provider/activity_list_provider.dart';
import 'package:splitmoney/routes/Groups/group_activities.dart';
import 'package:splitmoney/routes/Groups/group_detail_tab_item.dart';
import 'package:splitmoney/routes/Groups/group_settings_page.dart';
import 'package:splitmoney/utils/mini_heading_text.dart';
import 'package:splitmoney/utils/profile.dart';
import 'package:splitmoney/utils/sample_floating_action_button.dart';

// ignore: must_be_immutable
class GroupDetail extends StatefulWidget {
  Group group;
  GroupDetail({super.key, required this.group});

  @override
  State<GroupDetail> createState() => _GroupDetailState();
}

class _GroupDetailState extends State<GroupDetail> {
  @override
  Widget build(BuildContext context) {
    context.watch<ActivityListProvider>().activities;
    return SafeArea(
      child: Scaffold(
          floatingActionButton: SampleFloatingActionButton(
            group: widget.group,
          ),
          backgroundColor: Colors.grey[100],
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Profile(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return GroupSettingsPage(
                      id: widget.group.id,
                      groupName: widget.group.groupName,
                      imgChild: widget.group.grpImgChild,
                    );
                  })));
                },
                boxImageChild: widget.group.grpImgChild,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  widget.group.groupName,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Overall you are owed Rs. 600",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 14,
                      letterSpacing: 0.8,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const GroupDetailTabItem(),
              const SizedBox(
                height: 20,
              ),
              const MiniHeadingText(text: "May 2023"),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      "Activities",
                      style: TextStyle(
                          color: Colors.green[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              GroupActivities(
                group: widget.group,
              )
            ],
          )),
    );
  }
}
