import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/chat.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email;
  String password;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> register(email, password) async {
    AuthResult result = await _auth.createUserWithEmailAndPassword(
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
        title: Text('MANIT - Register'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "REGISTER",
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
              onChanged: (value) => email = value,
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
              obscureText: true,
              onChanged: (value) => password = value,
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
              await register(email, password);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 15.0),
            child: Text(
              "Register",
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
