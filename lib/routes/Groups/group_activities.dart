import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GroupActivities extends StatefulWidget {
  const GroupActivities({super.key});

  @override
  State<GroupActivities> createState() => _GroupActivitiesState();
}

class _GroupActivitiesState extends State<GroupActivities> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 100,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Text("hello");
            }),
      ),
    );
  }
}
