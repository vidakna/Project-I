import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:travel/screens/navpages/welcome_page.dart';
import 'package:travel/screens/reset_password.dart';
import 'package:travel/screens/signup.dart';
import 'package:travel/widgets/reusable_widget.dart';
// import 'package:firebase_core/firebase_core.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  //final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _key,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color.fromARGB(255, 183, 184, 184),
              Color.fromARGB(255, 212, 232, 232),
              Color.fromARGB(255, 184, 231, 231),
              Color.fromARGB(255, 134, 221, 214),
              Color.fromARGB(255, 88, 168, 159),
              Color.fromARGB(255, 92, 187, 225),
              Color.fromARGB(255, 125, 150, 167),
              Color.fromARGB(255, 56, 78, 103),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.2, 20, 0),
          child: Column(
            children: [
              logoWidget("img/logo3.jpeg"),
              const SizedBox(
                height: 30,
              ),
              reusableTextField("Enter Username", Icons.person_outline, false,
                  _emailTextController),
              const SizedBox(
                height: 30,
              ),
              reusableTextField(
                "Enter Password",
                Icons.lock_outline,
                false,
                _passwordTextController,
                // validator: (value) {
                //   if (value == null || value.isEmpty)
                //     return 'Field is required.';
                //   String pattern =
                //       r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$';
                //   if (!RegExp(pattern).hasMatch(value))
                //     return '''
                //               Password must be at least 8 characters,
                //               include an uppercase letter, number and symbol.
                //                          ''';
                //   return null;
                // },
              ),
              const SizedBox(
                height: 5,
              ),
              forgetPassword(context),
              firebaseButton(context, "Sign In", () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text)
                    .then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WelcomePage()));
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                });
              }),
              signUpOption()
            ],
          ),
        )),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have account ?",
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUpPage()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password ?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => ResetPasswordPage())),
      ),
    );
  }
}
