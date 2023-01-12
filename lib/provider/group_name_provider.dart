import 'package:flutter/material.dart';

import '../data/group_data.dart';
import '../models/group_model.dart';

class GroupNameProvider with ChangeNotifier {
  final List<Group> _groupList = groups;
  List<Group> get groupList => _groupList;

  void addToGroupList(Group group) {
    group.id = generateId();
    _groupList.add(group);
    notifyListeners();
  }

  // List<Group> getGroups() {
  //   return groups;
  // }

  int generateId() {
    int maxId = 0;
    for (int i = 0; i < _groupList.length; i++) {
      if (_groupList[i].id! > maxId) {
        maxId = _groupList[i].id!;
      }
    }
    return maxId + 1;
  }

  void removeGroup(int id) {
    _groupList.remove(getGroupById(id));
    notifyListeners();
  }

  Group getGroupById(int id) {
    // for group in _groupList{
    //   if group.id == id {
    //     return group;
    //   }
    // }
    return _groupList.firstWhere((group) => group.id == id);
  }

  void editGroup(int id, String groupName, Widget groupImage) {
    final Group group = getGroupById(id);
    group.groupName = groupName;
    group.grpImgChild = groupImage;
    notifyListeners();
  }
}
