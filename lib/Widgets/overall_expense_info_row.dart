import 'package:flutter/material.dart';
//Import utils
import 'package:splitmoney/utils/icon_button_sample.dart';

class OverallExpenseInfoRow extends StatelessWidget {
  const OverallExpenseInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text(
                "Overall, You are owned",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              Text(
                " Rs.316.24",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.green[300]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
