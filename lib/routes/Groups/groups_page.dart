import 'package:flutter/material.dart';

//Import Routes
import 'package:splitmoney/routes/Groups/add_group.dart';
import 'package:splitmoney/routes/add_expense.dart';
import 'package:splitmoney/routes/Groups/groups_page_display_list.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, AddExpense.routeName);
        },
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
      body: const GroupsPageDisplayList(),
    );
  }
}
