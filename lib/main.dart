import 'package:flutter/material.dart';
import './home.dart';
import './register.dart';
import './login.dart';
import './chat.dart';

void main() {
  runApp(
    MaterialApp(
        //home: Home(),
        routes: {
          '/': (context) => Home(),
          '/login': (context) => Login(),
          '/register': (context) => Register(),
          '/chat': (context) => Chat(),
        }),
  );
}
