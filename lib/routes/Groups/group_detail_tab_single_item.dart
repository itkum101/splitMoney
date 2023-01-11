import 'package:flutter/material.dart';

class GroupDetailTabSingleItem extends StatelessWidget {
  final String name;
  const GroupDetailTabSingleItem({super.key, this.name = "EX"});

  @override
  Widget build(BuildContext context) {
    Color tempColour = Colors.white;
    Color textColour = Colors.grey.shade800;
    if (name == "SETTLE UP") {
      tempColour = Colors.green.shade300;
      textColour = Colors.white;
    }
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(width: 1, color: Colors.grey.shade400),
                ),
              ),
              shadowColor: MaterialStateProperty.all<Color>(Colors.black),
              elevation: MaterialStateProperty.all(3),
              backgroundColor: MaterialStateProperty.all<Color>(tempColour)),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              name,
              style: TextStyle(
                color: textColour,
                letterSpacing: 0.8,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
    );
  }
}
