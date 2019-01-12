import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  App({Key key, this.title}) : super(key: key);
  final String title; 

  @override
  _AppState createState() => new _AppState();
}
class _AppState extends State<App> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body:Center(
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
                        'Back',
                        style: TextStyle(fontSize: 24.0),
                      )),
                ],
              ),
            ),
            onPressed: () {Navigator.pop(context);},
            color: Colors.white,
          ),
        )
      )
    );
  }
}