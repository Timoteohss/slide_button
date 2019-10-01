import 'package:flutter/material.dart';
import 'package:slide_button/slide_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();

  @override
  void initState() {
    super.initState();

    textController2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 64,
              width: double.infinity,
              color: Colors.grey,
              child: Center(
                  child: Column(
                children: <Widget>[
                  Text(
                      "The next slider has just been: ${textController1.text}"),
                  Text("The next slider value is: ${textController2.text}"),
                ],
              )),
            ),
            SlideButton(
              height: 64,
              backgroundChild: Center(
                child: Text("This is a centered text"),
              ),
              backgroundColor: Colors.amber,
              slidingBarColor: Colors.blue,
              slideDirection: SlideDirection.RIGHT,
              onButtonOpened: () {
                textController1.text = "Opened";
              },
              onButtonClosed: () {
                textController1.text = "Closed";
              },
              onButtonSlide: (value) {
                textController2.text = value.toString();
              },
            ),
            SlideButton(
              height: 64,
              borderRadius: 0.0,
              backgroundColor: Colors.transparent,
              slidingChild: Center(
                child: Text("This is a sliding text."),
              ),
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
