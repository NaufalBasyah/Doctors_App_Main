import 'package:flutter/material.dart';
import 'logInPage.dart';
import 'constraint.dart';
import 'welcomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: welcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
