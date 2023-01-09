import 'package:flutter/material.dart';


//Import Routes
import 'package:splitmoney/routes/Activity/activity_page_display_list.dart';
//Import Widgets
import 'package:splitmoney/Widgets/app_bar_sample.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    // var myActivityList = context.watch<ActivityListProvider>().activities;
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: AppBarSample(
            title: "Activities",
          ),
        ),
        body: const ActivityPageDisplayList());
  }
}
