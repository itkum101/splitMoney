import 'package:flutter/material.dart';
import 'package:splitmoney/models/group_model.dart';
import 'package:splitmoney/widgets/activity_list_item.dart';
import 'package:splitmoney/data/activity_data.dart';

class GroupActivities extends StatefulWidget {
  final Group group;
  const GroupActivities({super.key, required this.group});

  @override
  State<GroupActivities> createState() => _GroupActivitiesState();
}

class _GroupActivitiesState extends State<GroupActivities> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: activitiesDone.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            if (activitiesDone[index].involvedGroup == widget.group) {
              return ActivityListItem(
                  amount: activitiesDone[index].netAmount,
                  activity: activitiesDone[index].description);
            } else {
              return Container();
            }
          }),
    );
  }
}
