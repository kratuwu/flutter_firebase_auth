import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'app/app.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  String title;

  Future<FirebaseUser> _handleSignIn() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    FirebaseUser user = await _auth.signInWithGoogle(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    print("signed in " + user.displayName);
    return user;
  }

  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: MaterialButton(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Google login',
                    style: TextStyle(fontSize: 24.0),
                  )),
            ],
          ),
        ),
        onPressed: () {
          widget
              ._handleSignIn()
              .then((FirebaseUser user) => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => App(title: widget.title)),
                  ))
              .catchError((e) => print(e));
        },
        color: Colors.white,
      ),
    )));
  }
}
