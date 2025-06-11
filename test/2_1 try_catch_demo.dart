import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    String myMargin = 'abc';

    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(double.parse(myMargin)),
        color: Colors.red,
      ),
    );
  }
}
