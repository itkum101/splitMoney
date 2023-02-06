import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splitmoney/auth/forgot_pass.dart';
import 'package:splitmoney/widgets/alert_dialog_box.dart';

//shoukd be stateful widget
class LoginPage extends StatefulWidget {
  final VoidCallback
      showRegisterPage; // method that we are giving to gesturedetector
  const LoginPage({Key? key, required this.showRegisterPage})
      : super(
            key:
                key); // here after key"," comma is added and required this.showregisterpage is dded"

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController =
      TextEditingController(); //controllers for the textfields
  final _passwordController = TextEditingController();

  Future logIn() async {
    // creation of logIn method
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialogBox(alertText: e.message.toString());
          });
    }
  }

  @override
  void dispose() {
    _emailController.dispose(); // to dispose and free the momory(good practice)
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Center(
        //cloumn wrapped with center widget
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, //to align column in center vertically
            children: [
              //icon
              const Icon(
                Icons.headphones,
                size: 85,
              ),
              const SizedBox(
                height: 40,
              ),
              //welcome text
              Text(
                "Hello There",
                style: GoogleFonts.bebasNeue(
                  fontSize: 54,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Welcome Back, we missed you!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w100,
                ),
              ),
              const SizedBox(
                height: 50,
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
              //password textfield
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
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      controller: _passwordController, //controller linked
                      obscureText: true,
                      //textfield for password

                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              //forgot password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33),
                child: Row(
                  //wrapping with row makes it left aligned
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: ((context) {
                            return const ForgotPass();
                          })));
                        },
                        child: const Text(
                          "Forget Password?",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //button

              Padding(
                //outside padding of container
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: GestureDetector(
                  onTap:
                      logIn, //ontap function maa logIn vanni method call huncha mathi tyo method created ni cha
                  child: Container(
                    padding:
                        const EdgeInsets.all(15), //inside padding of container
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                        child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    )),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),

              //bottom text
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, // to center align the row in center horizontally
                children: [
                  const Text("Not a member?"),
                  GestureDetector(
                    // text where we want to add functionality when click, we wrat it with gesturedetector widget
                    onTap: widget.showRegisterPage,
                    child: const Text(
                      " Register Now",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
