import 'package:flutter/material.dart';
import 'package:splitmoney/auth/login_page.dart';
import 'package:splitmoney/auth/register_page.dart';


class TogglePage extends StatefulWidget {
  const TogglePage({Key? key}) : super(key: key);

  @override
  State<TogglePage> createState() => _TogglePageState();
}

class _TogglePageState extends State<TogglePage> {
  bool showLogin = true;
  void toggleScreens() {
    // a method to toggle screens
    setState(() {
      showLogin = !showLogin; // reversing
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return LoginPage(showRegisterPage: toggleScreens);
    } else {
      return RegisterPage(showLoginPage: toggleScreens);
    }
  }
}
