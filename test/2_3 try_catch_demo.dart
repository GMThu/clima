import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    String myMargin = 'abc';
    double myMarginAsDouble;

    try {
      myMarginAsDouble = double.parse(myMargin);
    } catch (e) {
      myMarginAsDouble = 30;
    }

    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(myMarginAsDouble),
        color: Colors.red,
      ),
    );
  }
}
