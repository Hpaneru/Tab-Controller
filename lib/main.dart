import 'package:flutter/material.dart';
import 'package:tabcontroller/customscrollview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabController tabController;

  @override
  Widget build(BuildContext context) {
    var tabBarItem = TabBar(
      tabs: [
        Tab(
          text: 'ASCOL',
        ),
        Tab(
          text: 'NIST',
        ),
        // Tab(
        //   text: 'KIST',
        // ),
      ],
      controller: tabController,
      indicatorColor: Colors.redAccent,
    );

    var listItem = ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Card(
            elevation: 5.0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Text("LIST ITEM $index"),
            ),
          ),
        );
      },
    );

    var gridView = GridView.builder(
        itemCount: 21,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Card(
              elevation: 5.0,
              child: Container(
                alignment: Alignment.center,
                child: Text('ITEM $index'),
              ),
            ),
          );
        });

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TAB CONTROLLER EG'),
          bottom: tabBarItem,
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            listItem,
            gridView,
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CustomScroll()),
            );
          },
        ),
      ),
    );
  }
}
