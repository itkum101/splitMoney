import 'package:flutter/material.dart';

class FriendList {
  final String friendName;
  final String friendEmail;
  final int netAmount;
  final Widget? imgChild;
  final String? phoneNumber;

  FriendList({
    required this.friendName,
    required this.friendEmail,
    required this.imgChild,
    this.netAmount = 0,
    this.phoneNumber,
  });
}

List<FriendList> friends = [
  FriendList(
      friendName: "Mukti Subedi",
      friendEmail: "muktisubedi@gmail.com",
      netAmount: 0,
      imgChild: const Icon(Icons.person)),
  FriendList(
      friendName: "Balkrishna Poudel",
      friendEmail: "balkrishnapoudel@gmail.com",
      netAmount: 0,
      imgChild: const Icon(Icons.person)),
  FriendList(
      friendName: "Aavash Chhetri",
      friendEmail: "aavashchhetri@gmail.com",
      netAmount: 0,
      imgChild: const Icon(Icons.person)),
  FriendList(
      friendName: "Ashim Sapkota",
      friendEmail: "ashimsapkota@gmail.com",
      netAmount: 0,
      imgChild: const Icon(Icons.person)),
];

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
