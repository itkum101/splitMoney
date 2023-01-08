import 'package:flutter/material.dart';

class GroupList {
  String groupName;
  Widget grpImgChild;
  GroupList({
    required this.groupName,
    required this.grpImgChild,
  });
}

List<GroupList> groups = [
  GroupList(
      groupName: "Group 1",
      grpImgChild: Padding(
        padding: const EdgeInsets.all(5),
        child: Image.asset(
          "lib/assets/shareholders.png",
          height: 65,
          width: 65,
        ),
      ))
];

class GroupNameProvider with ChangeNotifier {
  final List<GroupList> _groupList = groups;
  List<GroupList> get groupList => _groupList;

  void addToGroupList(GroupList group) {
    _groupList.add(group);
    notifyListeners();
  }

  void removeFromList(GroupList group) {
    _groupList.remove(group);
    notifyListeners();
  }
}
