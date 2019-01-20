import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/auth.dart';
import 'package:flutter_firebase_auth/auth_provider.dart';

import 'home.dart';

void main() => runApp(new MyApp());

@immutable
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new AuthProvider(
        auth: Auth(),
        child: MaterialApp(
          title: 'Google Firebase Auth',
          theme: new ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: new Home(title: 'Home Page'),
        ));
  }
}
