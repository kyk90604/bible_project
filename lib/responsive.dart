import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext) {
    final currentWidth = MediaQuery.of(context).size.width; //스크린의 가로길이
    final currentHeight = MediaQuery.of(context).size.height; //스크린의 세로길이

    return MaterialApp(
      home: Scaffold(
        backgroundColor: currentWidth < 600 //스크린 크기에 따른 배경색 변경
            ? Colors.blue[200]
            : Colors.red[200],
        body: Center(
          child: Text(currentWidth.toString()),
        ),
      ),
    );
  }
}
