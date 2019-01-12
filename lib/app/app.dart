import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class App extends StatefulWidget {
  App({Key key, this.title}) : super(key: key);
  final String title;

  void _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  _AppState createState() => new _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
          actions: <Widget>[
            FlatButton(
                child: Text('Logout'),
                onPressed: () => widget._signOut(context))
          ],
        ),
        body: Center(
            child: Container(margin: EdgeInsets.symmetric(horizontal: 20.0))));
  }
}
