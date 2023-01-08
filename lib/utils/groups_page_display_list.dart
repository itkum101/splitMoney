import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:splitmoney/provider/group_name_provider.dart';
import 'package:splitmoney/utils/data.dart';

import '../Widgets/group_tile.dart';

class GroupsPageDisplayList extends StatefulWidget {
  const GroupsPageDisplayList({super.key});

  @override
  State<GroupsPageDisplayList> createState() => _GroupsPageDisplayListState();
}

class _GroupsPageDisplayListState extends State<GroupsPageDisplayList> {
  @override
  Widget build(BuildContext context) {
    // var mygroupList = context.watch<GroupNameProvider>().groupList;
    return Column(
      children: [
        Container(
          height: 1,
          color: Colors.grey[400],
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
              IconButton(
                splashRadius: 20,
                  onPressed: () {},
                  icon: Icon(
                    Icons.dashboard_customize_rounded,
                    size: 27,
                    color: Colors.grey[900],
                  )),
            ],
          ),
        ),
        // Text("Add groups first:"),
        Expanded(child:
            Consumer<GroupNameProvider>(builder: ((context, value, child) {
          return ListView.builder(
              itemCount: value.groupList.length,
              itemBuilder: ((context, index) {
                return GroupTile(
                  name: value.groupList[index].groupName,
                  imgChild: value.groupList[index].grpImgChild,
                );
              }));
        }))),
      ],
    );
  }
}
