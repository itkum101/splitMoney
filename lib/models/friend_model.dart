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