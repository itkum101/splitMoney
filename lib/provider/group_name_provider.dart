import 'package:flutter/material.dart';

class GroupList {
  String imgPath;
  String groupName;
  GroupList({
    required this.imgPath,
    required this.groupName,
  });
}

List<GroupList> groups = [
  GroupList(groupName: "000", imgPath: "lib/assets/tea.png"),
  GroupList(groupName: "111", imgPath: "lib/assets/tea.png"),
  GroupList(groupName: "222", imgPath: "lib/assets/tea.png")
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
