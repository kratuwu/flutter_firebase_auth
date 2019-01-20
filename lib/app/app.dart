import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/auth_provider.dart';

class App extends StatefulWidget {
  App({Key key, this.title}) : super(key: key);
  final String title;

  void _signOut(BuildContext context) async {
    try {
      await AuthProvider.of(context).auth.signOut();
      Navigator.pop(context);
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
