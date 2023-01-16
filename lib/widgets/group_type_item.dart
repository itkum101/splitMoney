import 'package:flutter/material.dart';
import 'package:splitmoney/models/grouptype_data.dart';

class GroupTypeItem extends StatelessWidget {
  GroupTypes groupType;
  void Function()? onTap;

  GroupTypeItem({
    super.key,
    required this.groupType,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 13),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: groupType.isSelected
                      ? Colors.grey.shade900
                      : Colors.grey.shade700),
              color:
                  groupType.isSelected ? Colors.grey.shade300 : Colors.white60,
              borderRadius: BorderRadius.circular(20)),
          width: 110,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                groupType.icon,
                const SizedBox(
                  width: 5,
                ),
                Text(
                  groupType.type,
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
