import 'package:flutter/material.dart';

class ActivityListItem extends StatelessWidget {
  final int time;
  // final DateTime time

  final String activity;
  final int amount;
  const ActivityListItem(
      {super.key, required this.activity, required this.amount, this.time = 2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            Text(
              time.toString(),
              style: const TextStyle(
                  color: Colors.green,
                  fontSize: 19,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(width: 10),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                activity,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            Text(
              amount.toString(),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
