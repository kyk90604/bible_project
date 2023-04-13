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
            appbar(),
          ],
        ))),
      ),
    );
  }

//상단에 위치한 탭, 메뉴 바
  Widget appbar() {
    return Container(
        child:
            //상단 탭 및 메뉴
            IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  print('menu button is clicked');
                }));
  }
}
