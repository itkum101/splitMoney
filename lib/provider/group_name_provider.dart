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
      grpImgChild: Image.asset(
        "lib/assets/shareholders.png",
        height: 70,
        width: 70,
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
