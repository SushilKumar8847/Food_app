import 'package:flutter/material.dart';

class TabRoute extends StatefulWidget {
  const TabRoute({Key? key}) : super(key: key);

  @override
  _TabRouteState createState() => _TabRouteState();
}

class _TabRouteState extends State<TabRoute> {
  @override
  Widget build(BuildContext context) {
    return
        // DefaultTabController(
        // child:
        Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("Foodies"),
        centerTitle: true,
      ),
    );
  }
}
