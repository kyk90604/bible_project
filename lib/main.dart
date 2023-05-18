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
  bool _checkbox1Value = false;
  bool _checkbox2Value = false;
  bool _checkbox_search_style = false;
  List<bool> _checkboxValues = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      home: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '검색(여러개의 단어 검색시 ","로 구별)',
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 20, 0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Search'),
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
                  child: Row(
                    children: [
                      Text("정확한 검색 활성화"),
                      Container(
                        margin: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Checkbox(
                          value: _checkbox_search_style,
                          onChanged: (bool? value) {
                            setState(() {
                              _checkbox_search_style = value ?? false;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: Column(
                children: [
                  CheckboxListTile(
                    title: const Text('Checkbox 1'),
                    value: _checkbox1Value,
                    onChanged: (bool? value) {
                      setState(() {
                        _checkbox1Value = value ?? false;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Checkbox 2'),
                    value: _checkbox2Value,
                    onChanged: (bool? value) {
                      setState(() {
                        _checkbox2Value = value ?? false;
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text('Output line 1'),
                    const Text('Output line 2'),
                    const Text('Output line 3'),
                    const Text('Output line 4'),
                    const Text('Output line 5'),
                    const Text('Output line 6'),
                    const Text('Output line 7'),
                    const Text('Output line 8'),
                    const Text('Output line 9'),
                    const Text('Output line 10'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
