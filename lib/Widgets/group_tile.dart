// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:splitmoney/routes/Groups/group_detail.dart';

class GroupTile extends StatelessWidget {
  int index;
  final String name;
  final Widget? imgChild;
 GroupTile({super.key, required this.name, required this.imgChild, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: ((context) {
          return GroupDetail(groupName: name, groupImage: imgChild, index: index,);
        })));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.grey[200]),
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
      ),
    );
  }
}
