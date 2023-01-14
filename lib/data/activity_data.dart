import 'package:splitmoney/data/friend_data.dart';
import 'package:splitmoney/data/group_data.dart';
import 'package:splitmoney/models/friend_model.dart';
import 'package:uuid/uuid.dart';

import '../models/activity_model.dart';

var uuid = Uuid();
List<Activity> activitiesDone = [
  Activity(
      id: uuid.v1(),
      description: "Fuchhi ko ma chiya khayeko ",
      netAmount: 0,
      date: "MAY 2",
      paidBy: friends[0],
      involvedFriend: [...friends],
      involvedGroup: groups[1],
      amountEachFriendSpent: {friends[0]: 0.0}),
  Activity(
      netAmount: 0,
      id: uuid.v1(),
      description: "Aunty ko ma khana khayeko",
      date: "JAN 1",
      paidBy: friends[0],
      involvedGroup: groups[1],
      amountEachFriendSpent: {friends[0]: 0.0},
      involvedFriend: [...friends]),
];
