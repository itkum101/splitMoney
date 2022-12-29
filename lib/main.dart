import 'package:flutter/material.dart';

import 'package:splitmoney/routes/MainScreen.dart';
import 'package:splitmoney/routes/settingspage.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (ctx) => const MyApp(),
    },
    debugShowCheckedModeBanner: false,
    title: 'SplitMoney',
  ));
}
