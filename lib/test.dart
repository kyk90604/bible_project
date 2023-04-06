import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        body: Center(
            child: Container(
                child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Hello World'),
                Text('Hello World'),
                Text('Hello World'),
              ],
            ),
            Row(
              //버튼 두개를 가로로 배치
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  child: Text('RaisedButton'),
                  onPressed: () {},
                ),
                TextButton(
                  child: Text('FlatButton'),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ))),
      ),
    );
  }
}
