import 'package:splitmoney/data/friend_data.dart';

import '../models/activity_model.dart';

List<Activity> activitiesDone = [
  Activity(
      description: "Fuchhi ko ma chiya khayeko ",
      netAmount: 0,
      date: "MAY 2",
      paidBy: friends[0],
      involvedFriend: [...friends]),
  Activity(
      netAmount: 0,
      description: "Aunty ko ma khana khayeko",
      date: "JAN 1",
      paidBy: friends[0],
      involvedFriend: [...friends]),
];
