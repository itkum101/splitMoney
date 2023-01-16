import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/group_model.dart';

var uuid = Uuid();
List<Group> groups = [
  Group(
      id: uuid.v1(),
      groupName: "Own Expense",
      grpImgChild: Padding(
        padding: const EdgeInsets.all(5),
        child: Image.asset(
          "lib/assets/shareholders.png",
          height: 65,
          width: 65,
        ),
      ),
      type: "Home"),
  Group(
      id: uuid.v1(),
      groupName: "Group A",
      grpImgChild: Padding(
        padding: const EdgeInsets.all(5),
        child: Image.asset(
          "lib/assets/shareholders.png",
          height: 65,
          width: 65,
        ),
      ),
      type: "Home")
];
