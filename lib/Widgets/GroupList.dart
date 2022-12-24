import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GroupList extends StatelessWidget {
  const GroupList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: const [
        ListTile(
          title: Text('Group 1 '),
        ),
        ListTile(
          title: Text('Group 2 '),
        ),
        ListTile(
          title: Text('Group 3 '),
        ),
      ],
    );
  }
}
