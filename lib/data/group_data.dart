import 'package:flutter/material.dart';

import '../models/group_model.dart';

List<Group> groups = [
  Group(
      id: 1,
      groupName: "Group A",
      grpImgChild: Padding(
        padding: const EdgeInsets.all(5),
        child: Image.asset(
          "lib/assets/shareholders.png",
          height: 65,
          width: 65,
        ),
      ))
];
