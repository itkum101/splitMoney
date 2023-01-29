import 'package:flutter/material.dart';

class SettingsList {
  final icon;
  final Text settings;
  void Function()? onSettingsTap;
  SettingsList({
    required this.icon,
    required this.settings,
    this.onSettingsTap,
  });
}
