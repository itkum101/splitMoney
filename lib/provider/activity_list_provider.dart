import 'package:flutter/material.dart';

import '../data/activity_data.dart';
import '../models/activity_model.dart';

class ActivityListProvider with ChangeNotifier {
  final List<Activity> _activities = activitiesDone;

  List<Activity> get activities => _activities;

  void addToActiviityList(Activity activity) {
    activities.add(activity);
    notifyListeners();
  }

  void removeToActivityList(Activity activity) {
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
