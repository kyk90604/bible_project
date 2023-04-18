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
            Row(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: ConstrainedBox(
                      //메뉴버튼과 탭의 최소, 최대 크기를 설정
                      constraints:
                          const BoxConstraints(minWidth: 400, maxWidth: 500),
                      child: Row(
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: IconButton(
                                //메뉴버튼
                                icon: Icon(Icons.menu),
                                onPressed: () {
                                  print('menu button is clicked');
                                }),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            flex: 7,
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
                      )),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Search',
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      print('search button is clicked');
                    }),
              ],
            ),
            Container(
              //body
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  Center(child: Text("Home")),
                  Center(child: Text("Search"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
