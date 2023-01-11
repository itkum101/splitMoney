import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Import Provider
import 'package:splitmoney/provider/group_name_provider.dart';
//Import Widgets
import '../../widgets/group_tile.dart';
import 'package:splitmoney/widgets/overall_expense_info_row.dart';

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
        const SizedBox(height: 10),
        const OverallExpenseInfoRow(),
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
