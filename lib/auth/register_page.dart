import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splitmoney/widgets/alert_dialog_box.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);
  final _emailController =
      TextEditingController(); //controllers for the textfields
  final _passwordController = TextEditingController();

  void dispose() {
    _emailController.dispose(); // to dispose and free the momory(good practice)
    _passwordController.dispose();
  }

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController =
      TextEditingController(); //controllers for the textfields
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose(); // to dispose and free the momory(good practice)
    _passwordController.dispose();
    _confirmpasswordController.dispose();

    super.dispose();
  }

  bool passwordConfirmed() {
    // when confirmpass is equal to pass then only this returns true
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialogBox(alertText: "Passwords do not match");
          });
      return false;
    }
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      //only if function passwordconfirmed returns true then this code flows
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim());

        //add user detaile after user created
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
              const SizedBox(
                height: 30,
              ),
              Text(
                "Hello Folks",
                style: GoogleFonts.bebasNeue(
                  fontSize: 54,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Register below with your details:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w100,
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              //firstname textfield

              //lastname textfield

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
                height: 20,
              ),
              //confirm password textfield
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
                      controller:
                          _confirmpasswordController, //controller linked
                      obscureText: true,
                      //textfield for password

                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Confirm Password",
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                //outside padding of container
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: GestureDetector(
                  onTap:
                      signUp, //ontap function maa signUp vanni method call huncha mathi tyo method created ni cha
                  child: Container(
                    padding:
                        const EdgeInsets.all(15), //inside padding of container
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                        child: Text(
                      "Sign Up",
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
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, // to center align the row in center horizontally
                children: [
                  const Text("Already a member,"),
                  GestureDetector(
                    // text where we want to add functionality when click, we wrat it with gesturedetector widget
                    onTap: widget.showLoginPage,
                    child: const Text(
                      " Login",
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
