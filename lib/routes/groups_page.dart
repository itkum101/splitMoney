import 'package:flutter/material.dart';
import 'package:splitmoney/Widgets/group_tile.dart';
import 'package:splitmoney/utils/data.dart';
import 'package:splitmoney/routes/add_a_group.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.green,
        icon: const Icon(Icons.add_rounded),
        label: const Text("Add Expense"),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              splashRadius: 20,
              onPressed: () {},
              icon: Icon(
                Icons.search_rounded,
                size: 23,
                color: Colors.grey[800],
              )),
          const SizedBox(
            width: 7,
          ),
          IconButton(
              splashRadius: 20,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return AddGroup();
                })));
              },
              icon: Icon(
                Icons.group_add_sharp,
                size: 23,
                color: Colors.grey[800],
              )),
          const SizedBox(
            width: 17,
          ),
        ],
      ),
      body: Column(
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
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
                    onPressed: () {},
                    icon: Icon(
                      Icons.dashboard_customize_rounded,
                      size: 27,
                      color: Colors.grey[900],
                    )),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: groups.length,
                itemBuilder: ((context, index) {
                  return GroupTile(
                    name: groups[index].groupName,
                    imgname: groups[index].imgPath,
                  );
                })),
          ),
        ],
      ),
    );
  }
}
