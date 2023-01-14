import 'package:flutter/material.dart';
import 'package:splitmoney/data/friend_data.dart';
import 'package:splitmoney/data/group_data.dart';
import 'package:splitmoney/models/group_model.dart';

class Friend {
  final String friendName;
  final String friendEmail;
  double netAmount;
  final Widget? imgChild;
  final String? phoneNumber;
  final String id;
  final List<Group> joinedGroup;
  bool isSelected;

  Friend({
    required this.friendName,
    required this.friendEmail,
    required this.imgChild,
    required this.id,
    this.netAmount = 0,
    this.phoneNumber,
    this.isSelected = false,
    required this.joinedGroup,
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
      joinedGroup: this.joinedGroup,
    );
  }
}
