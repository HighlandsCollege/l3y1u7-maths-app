import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  Wrapper({
    Key key,
    @required this.child
  }) : super(key: key);

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
