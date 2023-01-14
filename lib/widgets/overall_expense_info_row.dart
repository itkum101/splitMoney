import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitmoney/provider/friend_name_provider.dart';
//Import utils
import 'package:splitmoney/utils/icon_button_sample.dart';

class OverallExpenseInfoRow extends StatelessWidget {
  final double name;
  const OverallExpenseInfoRow({super.key, this.name = 0.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                "Overall, You ${(name > 0) ? " are owed " : " owe "}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              Text(
                name.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: (name > 0) ? Colors.green[300] : Colors.red[300],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
