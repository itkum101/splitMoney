import 'package:flutter/material.dart';

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
}
