import 'package:flutter/material.dart';
import 'package:splitmoney/utils/activity_page_display_list.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    // var myActivityList = context.watch<ActivityListProvider>().activities;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Activity",
          style: TextStyle(
              color: Colors.grey[800],
              fontSize: 23,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: const ActivityPageDisplayList()
    );
  }
}
