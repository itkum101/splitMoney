import 'package:flutter/material.dart';

import '../data/group_data.dart';
import '../models/group_model.dart';

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
