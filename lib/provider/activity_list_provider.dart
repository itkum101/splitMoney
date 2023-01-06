import 'package:flutter/material.dart';

class ActivityList {
  final String description;
  final int netAmount;

  ActivityList({this.description = "", required this.netAmount});
}

List<ActivityList> activitiesDone = [
  ActivityList(
    description: "FUCCHI KO MA CHIYA KHAYEKO ",
    netAmount: 150,
  ),
  ActivityList(
    netAmount: 410,
    description: "TEHA PAXI KHANA KHAYEKO",
  ),
];

class ActivityListProvider with ChangeNotifier {
  final List<ActivityList> _activities = activitiesDone;

  List<ActivityList> get activities => _activities;

  void addToActiviityList(ActivityList activity) {
    activities.add(activity);
    notifyListeners();
  }

  void removeToActivityList(ActivityList activity) {
    activities.remove(activity);
    notifyListeners();
  }

  int returnTotalAmount() {
    int finalTotalAmount = 0;
    for (int i = 0; i < activities.length; i++) {
      finalTotalAmount += activities[i].netAmount;
    }
    notifyListeners();
    return finalTotalAmount;
  }
}
