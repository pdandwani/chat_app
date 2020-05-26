import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/chat.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email;
  String password;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login(email, password) async {
    AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Chat(
          user: user,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        backgroundColor: Colors.amber[500],
        title: Text('MANIT - Login'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "LOGIN",
              style: TextStyle(
                fontSize: 50.0,
                letterSpacing: 2.0,
              ),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Center(
            child: Text(
              "MANIT ALUMNI PORTAL",
              style: TextStyle(
                fontSize: 25.0,
                letterSpacing: 2.0,
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 7.5, 25.0, 7.5),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                //border: InputBorder.none,
                hintText: 'Enter your email...',
              ),
              style: TextStyle(
                fontSize: 22.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 7.5, 25.0, 7.5),
            child: TextField(
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                //border: InputBorder.none,
                hintText: 'Enter your password...',
              ),
              style: TextStyle(
                fontSize: 22.0,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            onPressed: () async {
              await login(email, password);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 15.0),
            child: Text(
              "Login",
              style: TextStyle(
                fontSize: 28.0,
              ),
            ),
            color: Colors.amber[500],
          ),
        ],
      ),
    );
  }
}
