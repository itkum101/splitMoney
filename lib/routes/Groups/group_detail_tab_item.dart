import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:splitmoney/data/groupdetail_tab_data.dart';
import 'package:splitmoney/routes/Groups/group_detail_tab_single_item.dart';

class GroupDetailTabItem extends StatelessWidget {
  const GroupDetailTabItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ListView.builder(
          itemCount: groupDetailTabtems.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return Row(
              children: [
                GroupDetailTabSingleItem(
                  name: groupDetailTabtems[index].tabTitle,
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            );
          })),
    );
  }
}
