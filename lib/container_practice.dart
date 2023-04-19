import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget build(BuildContext) {
    return MaterialApp(
      title: "test",
      home: Scaffold(
        body: Container(
            child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.red,
                child: Row(children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      color: Colors.blue,
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      color: Colors.blue,
                    ),
                  )
                ]),
              ),
            ),
            Flexible(
              flex: 9,
              child: Container(
                  child: Row(children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    color: Colors.yellow,
                  ),
                ),
                Flexible(
                  flex: 7,
                  child: Container(
                    color: Colors.green,
                    child: Column(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(5),
                            color: Color.fromARGB(255, 0, 55, 255),
                            child: Row(
                              children: [
                                Flexible(
                                    child: Container(
                                  color: Colors.red,
                                )),
                                Flexible(
                                    child: Container(
                                  color: Color.fromARGB(255, 254, 68, 251),
                                ))
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 9,
                          child: Container(
                            margin: EdgeInsets.all(10),
                            color: Colors.purple,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ])),
            ),
          ],
        )),
      ),
    );
  }
}
