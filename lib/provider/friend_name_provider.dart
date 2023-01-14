import 'dart:io';

import 'package:flutter/material.dart';
import 'package:splitmoney/data/activity_data.dart';

import '../data/friend_data.dart';
import '../models/friend_model.dart';

class FriendNameProvider with ChangeNotifier {
  final List<Friend> _friendList = friends;
  List<Friend> get friendList => _friendList;

  void addToFriendList(Friend friend) {
    friendList.add(friend);
    notifyListeners();
  }

  void removeFromList(Friend friend) {
    friendList.remove(friend);
    notifyListeners();
  }

  var amount;
  // void amountToPayOrReceive() {
  //   friends[0].netAmount = 0;
  //   for (int i = 0; i < activitiesDone.length; i++) {
  //     if (activitiesDone[i].involvedFriend.contains(friends[0])) {
  //       if (activitiesDone[i].paidBy == friends[0]) {
  //         friends[0].netAmount += activitiesDone[i].netAmount -
  //             activitiesDone[i].netAmount /
  //                 activitiesDone[i].involvedFriend.length;
  //       } else {
  //         friends[0].netAmount -= activitiesDone[i].netAmount /
  //             activitiesDone[i].involvedFriend.length;
  //       }
  //     } else {
  //       if (activitiesDone[i].paidBy == friends[0]) {
  //         friends[0].netAmount += activitiesDone[i].netAmount;
  //       } else {
  //         continue;
  //       }
  //     }
  //   }
  //   notifyListeners();
  // }

  // void amountToPayOrReceive() {
  //   for (int j = 0; j < friends.length; j++) {
  //     friends[j].netAmount = 0;
  //     for (int i = 0; i < activitiesDone.length; i++) {
  //       if (activitiesDone[i].involvedFriend.contains(friends[j])) {
  //         if (activitiesDone[i].paidBy == friends[j]) {
  //           friends[j].netAmount += activitiesDone[i].netAmount -
  //               activitiesDone[i].netAmount /
  //                   activitiesDone[i].involvedFriend.length;
  //         } else {
  //           friends[j].netAmount -= activitiesDone[i].netAmount /
  //               activitiesDone[i].involvedFriend.length;
  //         }
  //       } else {
  //         if (activitiesDone[i].paidBy == friends[j]) {
  //           friends[j].netAmount += activitiesDone[i].netAmount;
  //         } else {
  //           continue;
  //         }
  //       }
  //     }
  //   }
  //   notifyListeners();
  // }

  // var p = 0.0;
  // void calculate(Friend friend) {
  //   if (friend != friends[0]) {
  //     p = 0.0;
  //     for (int i = 0; i < activitiesDone.length; i++) {
  //       if (friends[0].id == activitiesDone[i].paidBy.id &&
  //           activitiesDone[i].involvedFriend.contains(friend)) {
  //         p += activitiesDone[i].netAmount /
  //             activitiesDone[i].involvedFriend.length;
  //       } else {
  //         if (friends[0].id != activitiesDone[i].paidBy.id) {
  //           if (activitiesDone[i].involvedFriend.contains(friends[0]) &&
  //               activitiesDone[i].paidBy == friend) {
  //             p -= activitiesDone[i].netAmount /
  //                 activitiesDone[i].involvedFriend.length;
  //           }
  //         }
  //       }
  //     }
  //   }

  //   notifyListeners();
  // }
  var p = 0.0;
  void calculate() {
    for (int i = 0; i < friends.length; i++) {
      Friend friend = friends[i];
      friend.netAmount = 0;
      if (friend == friends[0]) continue;
      for (int i = 0; i < activitiesDone.length; i++) {
        if (activitiesDone[i].paidBy == friends[0] &&
            activitiesDone[i].amountEachFriendSpent.containsKey(friend)) {
          friend.netAmount += activitiesDone[i].amountEachFriendSpent[friend]!;
        } else if (activitiesDone[i].paidBy == friend &&
            activitiesDone[i].amountEachFriendSpent.containsKey(friends[0])) {
          friend.netAmount -=
              activitiesDone[i].amountEachFriendSpent[friends[0]]!;
        }
      }
      p += friend.netAmount;
    }
    notifyListeners();
  }

  void amountToPayOrReceive() {}

  double get amounts2 => p;
  double get amounts => friends[0].netAmount;
  List<Friend> get contactList => friends;
}
