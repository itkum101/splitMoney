import 'package:flutter/material.dart';
import 'package:splitmoney/widgets/activity_list_item.dart';
import 'package:splitmoney/data/activity_data.dart';


class GroupActivities extends StatefulWidget {
  const GroupActivities({super.key});

  @override
  State<GroupActivities> createState() => _GroupActivitiesState();
}

class _GroupActivitiesState extends State<GroupActivities> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        12,
      ),
      height: 250,
      child: Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: activitiesDone.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return ActivityListItem(
                  amount: activitiesDone[index].netAmount,
                  activity: activitiesDone[index].description);
            }),
      ),
    );
  }
}
