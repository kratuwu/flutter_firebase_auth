import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(new MyApp());
@immutable

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Poke Score',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Home(title: 'Flutter Demo Home Page'),
    );
  }
}
