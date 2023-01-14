import 'package:flutter/material.dart';

class GroupTypeItem extends StatelessWidget {
  final icon;
  final String type;
  void Function()? onTap;
  bool selected;

  GroupTypeItem(
      {super.key,
      required this.icon,
      required this.type,
      required this.onTap,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 13),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color:
                      selected ? Colors.grey.shade900 : Colors.grey.shade700),
              color: selected ? Colors.grey.shade300 : Colors.white60,
              borderRadius: BorderRadius.circular(20)),
          width: 110,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                icon,
                const SizedBox(
                  width: 5,
                ),
                Text(
                  type,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
