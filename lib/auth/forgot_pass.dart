import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splitmoney/utils/sample_elevated_button.dart';
import 'dart:async';

import 'package:splitmoney/widgets/alert_dialog_box.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    // passwordReset method
    try {
      // try to validate, if annot validate catch error e.
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialogBox(alertText: "Check your mail for password reset link.");
          });
    } on FirebaseAuthException catch (e) {
      print(e); // print e in consloe
      showDialog(
          //showing dialogue
          context: context,
          builder: (context) {
            // in builder write"(context){}"
            return AlertDialogBox(alertText: e.message.toString());
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
            title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Reset Password",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Center(
                child: Text(
                  "Enter your email below to recieve a mail with password reset link:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            //email textfield
            Padding(
              //container wrapped with padding
              padding: const EdgeInsets.symmetric(
                  horizontal: 30.0), //gives horizontal padding of 30px
              child: Container(
                //textfield wrapped with container
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  //textfield also wrapped with padding
                  padding: const EdgeInsets.only(left: 20),
                  child: TextField(
                    //textfield for email

                    controller: _emailController, //controller linked
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SampleElevatedButton(
              buttonText: "Reset",
              onPressed: passwordReset,
            )
          ],
        ));
  }
}
