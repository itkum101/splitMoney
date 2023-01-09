import 'package:flutter/material.dart';

import '../models/setting_model.dart';

List<SettingsList> settingslist = [
  SettingsList(
    icon: const Icon(
      Icons.qr_code_2_rounded,
      size: 30,
    ),
    settings: Text(
      "Scan Code",
      style: TextStyle(
          fontSize: 16, color: Colors.grey[800], fontWeight: FontWeight.w500),
    ),
  ),
  SettingsList(
    icon: const Icon(
      Icons.email_rounded,
      size: 30,
    ),
    settings: Text(
      "Email settings",
      style: TextStyle(
          fontSize: 16, color: Colors.grey[800], fontWeight: FontWeight.w400),
    ),
  ),
  SettingsList(
    icon: const Icon(
      Icons.notifications,
      size: 30,
    ),
    settings: Text(
      "Notification settings",
      style: TextStyle(
          fontSize: 16, color: Colors.grey[800], fontWeight: FontWeight.w400),
    ),
  ),
  SettingsList(
    icon: const Icon(
      Icons.password_rounded,
      size: 30,
    ),
    settings: Text(
      "Password",
      style: TextStyle(
          fontSize: 16, color: Colors.grey[800], fontWeight: FontWeight.w400),
    ),
  ),
  SettingsList(
    icon: const Icon(
      Icons.rate_review_rounded,
    ),
    settings: Text(
      "Rate Us",
      style: TextStyle(
          fontSize: 16, color: Colors.grey[800], fontWeight: FontWeight.w400),
    ),
  ),
  SettingsList(
    icon: const Icon(
      Icons.contact_support_rounded,
    ),
    settings: Text(
      "Contact Us",
      style: TextStyle(
          fontSize: 16, color: Colors.grey[800], fontWeight: FontWeight.w400),
    ),
  ),
  SettingsList(
    icon: const Icon(
      Icons.logout_outlined,
      color: Colors.green,
    ),
    settings: const Text(
      "Log Out",
      style: TextStyle(
          fontSize: 16, color: Colors.green, fontWeight: FontWeight.w500),
    ),
  )
];
