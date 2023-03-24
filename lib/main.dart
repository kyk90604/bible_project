import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
              title: Text("성경 검색")
          ),
          body: Container( 
            width: double.infinity, height: 200,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child:Image.asset('test1.png')
                ),
                Expanded(
                  child:Container(
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                      child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text("팝니다 노트북 asd \n하나둘셋넷"),
                              Text("용전동"),
                              Text("40원"),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                  Text("aaa"),
                                  Icon(Icons.heart_broken_sharp),
                                  Text("11")
                                ]
                              )
                        ]
                      )
                    ),
                )
              ]
            )
        )
    ));}}