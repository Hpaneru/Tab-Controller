import 'package:flutter/material.dart';
import 'package:tabcontroller/silvergrid.dart';

class SliverListScreen extends StatefulWidget {
  @override
  _SliverListScreenState createState() => _SliverListScreenState();
}

class _SliverListScreenState extends State<SliverListScreen> {
  List _buildList(int count) {
    List<Widget> listItems = List();

    for (int i = 0; i < count; i++) {
      listItems.add(new Padding(
          padding: new EdgeInsets.all(20.0),
          child: new Text('ITEM ${i.toString()}',
              style: new TextStyle(fontSize: 25.0))));
    }

    return listItems;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 100.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Sliver List"),
              ),
            ),
            SliverList(delegate: new SliverChildListDelegate(_buildList(21))),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SliverGridScreen()),
            );
          },
        ),
      ),
    );
  }
}
