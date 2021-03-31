import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  ProgressBar({
    Key key,
    @required this.begin,
    @required this.end
  }) : super(key: key);

  final double begin;
  final double end;

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _widthAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this
    );

    _widthAnimation = Tween<double>(
      begin: widget.begin,
      end: widget.end
    ).animate(_controller);

    _controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: 200,
      child: Row(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, _) {
              return Container(
                height: 10,
                width: _widthAnimation.value,
                decoration: BoxDecoration(
                  color: Color(0xff6C63FF),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                )
              );
            },
          )
        ],
      )
    );
  }
}