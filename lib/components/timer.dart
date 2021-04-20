import 'package:flutter/material.dart';

class TimerProgress extends StatefulWidget {
  TimerProgress({
    Key key,
    @required this.time,
    @required this.onCompleted
  }) : super(key: key);

  final int time;
  final Function onCompleted;

  @override
  _TimerProgressState createState() => _TimerProgressState();
}

class _TimerProgressState extends State<TimerProgress> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _widthAnimation;

  @override
  void didChangeDependencies() {
    _controller = AnimationController(
      duration: Duration(seconds: widget.time),
      vsync: this
    );

    _widthAnimation = Tween<double>(
      begin: 200,
      end: 0
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear
    ))..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onCompleted();
      }
    });

    _controller.forward();

    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(old) {
    _controller.duration = Duration(seconds: widget.time);
    _controller.reset();
    _controller.forward();

    super.didUpdateWidget(old);
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
                  color: Color(0xffF50057),
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