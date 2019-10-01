import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:slide_button/slide_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SlideButton(
              height: 64,
              backgroundChild: Center(
                child: Text("This is a centered text"),
              ),
              backgroundColor: Colors.amber,
              slidingBarColor: Colors.blue,
              slideDirection: SlideDirection.RIGHT,
            ),
            SlideButton(
              height: 64,
              borderRadius: 0.0,
              backgroundColor: Colors.transparent,
              slidingChild: Center(child: Text("This is a sliding text."),),
              slidingBarColor: Colors.blue,
              slideDirection: SlideDirection.LEFT,
            ),
            SlideButton(
              height: 64,
              slidingChild: Align(
                alignment: Alignment.centerRight,
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Icon(Icons.chevron_right)),
              ),
              backgroundColor: Colors.amber,
              slidingBarColor: Colors.blue,
              slideDirection: SlideDirection.RIGHT,
            ),
            SizedBox(
              height: 300,
              child: SlideButton(
                backgroundColor: Colors.amber,
                backgroundChild: Center(
                  child: Text("I'm expandable!"),
                ),
                slidingBarColor: Colors.blue,
                slideDirection: SlideDirection.LEFT,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
