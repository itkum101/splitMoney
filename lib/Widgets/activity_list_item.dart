import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ActivityListItem extends StatelessWidget {
  final int time;
  // final DateTime time

  final String activity;
  final int amount;
  const ActivityListItem(
      {super.key, required this.activity, required this.amount, this.time = 2});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          time.toString(),
          style: TextStyle(
            color: Colors.green,
            fontSize: 15,
          ),
        ),
        Spacer(),
        Text(
          activity,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        Spacer(),
        Text(
          amount.toString(),
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
