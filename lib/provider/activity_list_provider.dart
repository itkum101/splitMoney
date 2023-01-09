import 'package:flutter/material.dart';

import '../data/activity_data.dart';
import '../models/activity_model.dart';

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
    return finalTotalAmount;
  }
}
