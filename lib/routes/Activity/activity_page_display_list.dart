import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Import Providers
import 'package:splitmoney/provider/activity_list_provider.dart';
// Import Widgets
import 'package:splitmoney/widgets/activity_tile.dart';

class ActivityPageDisplayList extends StatelessWidget {
  const ActivityPageDisplayList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 1,
          color: Colors.grey[400],
        ),
        const SizedBox(height: 15),
        Expanded(child:
            Consumer<ActivityListProvider>(builder: ((context, value, child) {
          return ListView.builder(
            itemCount: value.activities.length,
            itemBuilder: (((context, index) {
              return ActivityTile(
                description: value.activities[index].description,
                amount: value.activities[index].netAmount,
                person: value.activities.length,
              );
            })),
          );
        }))),
      ],
    );
  }
}
