import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GroupDetailTabSingleItem extends StatelessWidget {
  final String name;
  const GroupDetailTabSingleItem({super.key, this.name = "EX"});

  @override
  Widget build(BuildContext context) {
    Color tempColour = Colors.grey;
    if (name == "SETTLE UP") {
      tempColour = Colors.deepOrangeAccent;
    }
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        shape: BoxShape.rectangle,
        // boxShadow: [
        //   BoxShadow(
        //       color: Colors.grey.shade600,
        //       spreadRadius: 1,
        //       blurRadius: 15,
        //       offset: const Offset(0, 5))
        // ],

        color: tempColour,
      ),
      child: Text(
        name,
        style: TextStyle(
          letterSpacing: 0.8,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
