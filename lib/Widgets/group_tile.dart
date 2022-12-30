import 'package:flutter/material.dart';

class GroupTile extends StatelessWidget {
  final String name;
  final String imgname;
  const GroupTile({super.key, required this.name, required this.imgname});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[400]),
            child: Image.asset(
              imgname,
              height: 70,
              width: 85,
            ),
          ),
          const SizedBox(
            width: 23,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "You are owned Rs 66.25",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[300]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
