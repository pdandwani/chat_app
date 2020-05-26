import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        backgroundColor: Colors.amber[500],
        title: Text('MANIT'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Center(
                child: Image.asset('assets/manit.png'),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
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
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
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
      ),
    );
  }
}
