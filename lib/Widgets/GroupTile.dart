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
          CircleAvatar(
            radius: 40,
            backgroundImage: ExactAssetImage(imgname),
            backgroundColor: Colors.transparent,
          ),
          const SizedBox(
            width: 23,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
          )
        ],
      ),
    );
  }
}
