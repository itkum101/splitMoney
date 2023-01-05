import 'package:flutter/material.dart';
import 'package:splitmoney/Widgets/activity_tile.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          Container(
            height: 1,
            color: Colors.grey[400],
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView(
              children: [
                ActivityTile(),
                ActivityTile(),
                ActivityTile(),
                ActivityTile(),
                ActivityTile(),
                ActivityTile(),
                ActivityTile(),
                ActivityTile(),
                ActivityTile(),
                ActivityTile(),
                ActivityTile(),
                ActivityTile(),
                ActivityTile(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
