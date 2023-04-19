import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Welcome to Flutter',
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

//상단에 위치한 탭, 메뉴 바
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Flexible(
              // 상단 탭 및 검색창
              flex: 0,
              child: Row(
                children: [
                  Flexible(
                    //메뉴버튼과 탭 바
                    child: Row(
                      children: [
                        Flexible(
                          //메뉴 버튼
                          fit: FlexFit.tight,
                          flex: 1,
                          child: IconButton(
                              icon: Icon(Icons.menu),
                              onPressed: () {
                                print('menu button is clicked');
                              }),
                        ),
                        Flexible(
                          //탭 바
                          fit: FlexFit.tight,
                          flex: 5,
                          child: TabBar(
                              labelColor: Colors.black,
                              controller: _tabController,
                              tabs: [
                                Tab(
                                  text: 'List',
                                ),
                                Tab(
                                  text: 'gred',
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    fit: FlexFit.tight, //검색창
                    child: Row(
                      children: [
                        Flexible(
                          flex: 5,
                          fit: FlexFit.tight,
                          child: Row(
                            //검색 텍스트창과 상세검색 버튼
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Search',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            child: Row(
                              children: [
                                IconButton(
                                    icon: Icon(Icons.search),
                                    onPressed: () {
                                      print('search button is clicked');
                                    }),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              //body
              flex: 1,
              fit: FlexFit.tight,
              child: Row(
                children: [
                  Flexible(
                    //body left
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                  Flexible(
                    //body right
                    flex: 4,
                    fit: FlexFit.tight,
                    child: Container(
                      //탭바 뷰
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          Container(
                              child: Center(
                            child: Text('읽기 창'),
                          )),
                          Container(
                              child: Center(
                            child: Text('구절 검색 결과 창'),
                          )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
