import 'package:flutter/material.dart';
import 'package:splitmoney/models/grouptype_data.dart';

List<GroupTypes> grouptype = [
  GroupTypes(icon: const Icon(Icons.airplanemode_on_outlined), type: "Trip",isSelected: false),
  GroupTypes(icon: const Icon(Icons.home_outlined), type: "Home", isSelected: false),
  GroupTypes(icon: const Icon(Icons.favorite_outline_rounded), type: "Couple",
      isSelected: false),
  GroupTypes(icon: const Icon(Icons.list_alt_outlined), type: "Others",
      isSelected: false),
];
