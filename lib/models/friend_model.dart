import 'package:flutter/material.dart';
import 'package:splitmoney/data/friend_data.dart';

class Friend {
  final String friendName;
  final String friendEmail;
  double netAmount;
  final Widget? imgChild;
  final String? phoneNumber;
  final String id;

  bool isSelected;

  Friend({
    required this.friendName,
    required this.friendEmail,
    required this.imgChild,
    required this.id,
    this.netAmount = 0,
    this.phoneNumber,
    this.isSelected = false,
  });
  Friend copyWith() {
    return Friend(
      friendEmail: this.friendEmail,
      friendName: this.friendName,
      imgChild: this.imgChild,
      id: this.id,
      netAmount: this.netAmount,
      phoneNumber: this.phoneNumber,
      isSelected: this.isSelected,
    );
  }
}
