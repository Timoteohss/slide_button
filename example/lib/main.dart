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
              backgroundChild: Center(child: Text("KEK"),),
              backgroundColor: Colors.amber,
              slidingBarColor: Colors.blue,
              slideDirection: SlideDirection.RIGHT,
            ),
            SlideButton(
              height: 64,
              backgroundColor: Colors.amber,
              slidingBarColor: Colors.blue,
              slideDirection: SlideDirection.LEFT,
            ),

            
          ],
        ),
      ),
    );
  }
}
