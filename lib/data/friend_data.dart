import 'package:flutter/material.dart';
import 'package:splitmoney/data/group_data.dart';
import 'package:uuid/uuid.dart';

import '../models/friend_model.dart';

var uuid = Uuid();
List<Friend> friends = [
  Friend(
    id: uuid.v1(),
    friendName: "Mukti Subedi",
    friendEmail: "muktisubedi@gmail.com",
    netAmount: 0,
    isSelected: false,
    imgChild: const Icon(Icons.person),
    joinedGroup: [groups[0]],
  ),
  Friend(
      id: uuid.v1(),
      friendName: "Balkrishna Poudel",
      friendEmail: "balkrishnapoudel@gmail.com",
      netAmount: 0,
      isSelected: false,
      joinedGroup: [groups[0]],
      imgChild: const Icon(Icons.person)),
  Friend(
      id: uuid.v1(),
      friendName: "Aavash Chhetri",
      friendEmail: "aavashchhetri@gmail.com",
      netAmount: 0,
      isSelected: false,
      joinedGroup: [groups[0]],
      imgChild: const Icon(Icons.person)),
  Friend(
      id: uuid.v1(),
      friendName: "Ashim Sapkota",
      friendEmail: "ashimsapkota@gmail.com",
      netAmount: 0,
      isSelected: false,
      joinedGroup: [groups[0]],
      imgChild: const Icon(Icons.person)),
];
