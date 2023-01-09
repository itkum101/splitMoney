import 'package:flutter/material.dart';

import '../data/friend_data.dart';
import '../models/friend_model.dart';

class FriendNameProvider with ChangeNotifier {
  final List<FriendList> _friendList = friends;
  List<FriendList> get friendList => _friendList;

  void addToFriendList(FriendList friend) {
    friendList.add(friend);
    notifyListeners();
  }

  void removeFromList(FriendList friend) {
    friendList.remove(friend);
    notifyListeners();
  }
}
