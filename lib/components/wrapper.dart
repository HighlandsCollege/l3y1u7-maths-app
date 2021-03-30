import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  Wrapper({@required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(8, 20, 8, 20),
          child: Center(
            child: child
          )
        )
      )
    );
  }
}
