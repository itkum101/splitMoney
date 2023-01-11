import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:splitmoney/data/groupdetail_tab_data.dart';
import 'package:splitmoney/routes/Groups/group_detail_tab_single_item.dart';

class GroupDetailTabItem extends StatelessWidget {
  const GroupDetailTabItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 40,
        child: ListView.builder(
            itemCount: groupDetailTabtems.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              return GroupDetailTabSingleItem(
                name: groupDetailTabtems[index].tabTitle,
              );
            })),
      ),
    );
  }
}
