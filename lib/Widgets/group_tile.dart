import 'package:flutter/material.dart';
import 'package:splitmoney/routes/Groups/group_detail.dart';

class GroupTile extends StatelessWidget {
  final String name;
  final Widget? imgChild;
  const GroupTile({super.key, required this.name, required this.imgChild});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => {
        Navigator.pushNamed(
          context,
          GroupDetail.routeName,
        )
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[400]),
              child: imgChild,
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
      ),
    );
  }
}
