import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogIn extends StatelessWidget {
  LogIn({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            "Welcome",
            style: TextStyle(
                color: CupertinoColors.systemBlue,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
        elevation: 0.5,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintStyle: TextStyle(color: CupertinoColors.systemBlue),
                  hintText: "Enter E-mail"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintStyle: TextStyle(color: CupertinoColors.systemBlue),
                  hintText: "Enter Password"),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text);
              },
              child: Text("SIGN IN")),
Expanded(child: SizedBox()),
            
      
            SizedBox(
              height: 21,
              child: InkWell(
                onTap: signInWithGoogle,
                child: Image(
                  image: NetworkImage(
                      "https://cdn.iconscout.com/icon/free/png-256/google-470-675827.png"),
                ),
              ),
            ),
       

          Align(alignment: Alignment.bottomCenter,
            child: Center(
              child: Text(
                "SiGN UP WITH GOOGLE",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 10),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
