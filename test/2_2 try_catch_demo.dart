import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    String myMargin = 'abc';

    try {
      return Scaffold(
        body: Container(
          margin: EdgeInsets.all(double.parse(myMargin)),
          color: Colors.red,
        ),
      );
    } catch (e) {
      return Scaffold(
        body: Container(margin: EdgeInsets.all(30), color: Colors.red),
      );
    }
  }
}
