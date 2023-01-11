import 'package:flutter/material.dart';
import 'package:splitmoney/routes/Groups/group_activities.dart';
import 'package:splitmoney/routes/Groups/group_detail_tab_item.dart';
import 'package:splitmoney/utils/base_app_bar.dart';
import 'package:splitmoney/utils/profile.dart';

class GroupDetail extends StatefulWidget {
  static const routeName = '/group-detail';
  const GroupDetail({super.key});

  @override
  State<GroupDetail> createState() => _GroupDetailState();
}

class _GroupDetailState extends State<GroupDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          appBar: AppBar(),
          title: Text("Group Detail"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Profile(),
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Overall you are owed Rs. 600",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 14,
                      letterSpacing: 0.8,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                GroupDetailTabItem(),
                SizedBox(
                  height: 20,
                ),
                Text("MAY 2023"),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Activities",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      letterSpacing: 0.8,
                      fontWeight: FontWeight.w600),
                ),
                GroupActivities(),
              ],
            )
          ],
        ));
  }
}
