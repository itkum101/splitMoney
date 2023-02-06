import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:splitmoney/auth/toggle_page.dart';
import 'package:splitmoney/routes/main_screen.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            //streambuilder with checking of non null user is necessary
            stream: FirebaseAuth.instance
                .authStateChanges(), // stream of firebase.instance iistens ofr any auth changes
            builder: (context, snapshot) {
              //now in the builder , the snapshot gives the information for user
              if (snapshot.hasData) {
                //if snapshot has data then homepage is returned
                return const MyApp();
              } else {
                //else login page is returned
                return const TogglePage();
              }
            }));
  }
}
