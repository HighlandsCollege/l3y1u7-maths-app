import 'package:flutter/material.dart';

class Level1 extends StatefulWidget {
  Level1({Key key}) : super(key: key);

  @override
  _Level1 createState() => _Level1();
}

class _Level1 extends State<Level1> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(padding: EdgeInsets.all(20), child: Text('hello'))),
    );
  }
}
