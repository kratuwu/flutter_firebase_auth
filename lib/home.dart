import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/auth_provider.dart';
import 'app/app.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  void validateAndSubmit() async {
    await AuthProvider.of(context).auth.signIn();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => App(title: widget.title)),
    );
    Navigator.pop(context);
  }

  @override
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
        onPressed: validateAndSubmit,
        color: Colors.white,
      ),
    )));
  }
}
