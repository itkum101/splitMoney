import 'package:flutter/material.dart';

class Friend {
  final String friendName;
  final String friendEmail;
  final int netAmount;
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
}
