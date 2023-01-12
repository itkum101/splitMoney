import 'package:flutter/material.dart';
import 'package:splitmoney/routes/Groups/group_activities.dart';
import 'package:splitmoney/routes/Groups/group_detail_tab_item.dart';
import 'package:splitmoney/routes/Groups/group_settings_page.dart';
import 'package:splitmoney/utils/icon_button_sample.dart';
import 'package:splitmoney/utils/mini_heading_text.dart';
import 'package:splitmoney/utils/profile.dart';
import 'package:splitmoney/widgets/app_bar_sample.dart';

class GroupDetail extends StatefulWidget {
  static const routeName = '/group-detail';
  const GroupDetail({super.key});

  @override
  State<GroupDetail> createState() => _GroupDetailState();
}

class _GroupDetailState extends State<GroupDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[100],
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Profile(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return const GroupSettingsPage();
                })));
              }),
              const SizedBox(height: 10),
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
              const GroupActivities()
            ],
          )),
    );
  }
}
