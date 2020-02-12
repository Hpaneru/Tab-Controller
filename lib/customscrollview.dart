import 'package:flutter/material.dart';
import 'package:tabcontroller/silverlist.dart';


class CustomScroll extends StatefulWidget {
  @override
  _CustomScrollState createState() => _CustomScrollState();
}

class _CustomScrollState extends State<CustomScroll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 100.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("SliverAppBar"),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 600,
              child: Center(
                child: Text('SILVER TO BOX ADAPTER'),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SliverListScreen()),
          );
        },
      ),
    );
  }
}
