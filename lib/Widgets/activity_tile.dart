import 'package:flutter/material.dart';

class ActivityTile extends StatelessWidget {
  final int hrformat = DateTime.now().hour;
  final color = Colors.grey[800];
  final double fontsize = 18;

  final String description;
  final int amount;
  final int person;

  ActivityTile(
      {super.key,
      required this.description,
      required this.amount,
      required this.person});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: GestureDetector(
        onTap: () {
          print("Clicked");
        },
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[400]),
              child: Image.asset(
                "lib/assets/tea.png",
                height: 60,
                width: 60,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${"Mukti S."} added ${amount} for  ${description}",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: color,
                        fontSize: fontsize),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "You owe back Rs ${amount / person}",
                    style: TextStyle(color: Colors.red, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "${DateTime.now().month.toString()}-${DateTime.now().day.toString()}, ",
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                      Text(
                        "${hrformat > 12 ? (hrformat - 12).toString() : hrformat.toString()}:${DateTime.now().minute.toString()} ",
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                      Text(
                        hrformat > 12 ? "PM" : "AM",
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
