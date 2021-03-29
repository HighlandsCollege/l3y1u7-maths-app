import 'package:flutter/material.dart';
import 'dart:math';
import 'views/start.dart';
import 'views/level_1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Awesome maths game',
      home: Start()
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _question = '';
  double _correct = 0;
  double _totalAnswers = 0;
  double _score = 0;
  String _operator = '';
  List<double> _buffer = [];

  @override
  void initState() {
    _generateQuestion();
    super.initState();
  }

  Future<void> _generateQuestion() async {
    List<double> list = await _randomInt();
    setState(() {
      _question = 'What is ${list[0]} $_operator ${list[1]}?';
      _correct = list[2];
    });
  }

  void _verifyAnswer(double answer) {
    if (answer == _correct) {
      setState(() {
        _score++;
      });
    }

    setState(() {
      _totalAnswers++;
    });

    _generateQuestion();
  }

  void _setBuffer(double correct) async {
    var rng = new Random();
    List<double> buffer = [];

    for (var i = 0; i < 4; i++) {
      buffer.add(rng.nextInt(20).toDouble());
    }

    buffer[rng.nextInt(3)] = correct;

    setState(() {
      _buffer = buffer;
    });
  }

  Future<List<double>> _randomInt() async {
    var rng = new Random();

    double x = rng.nextInt(12).toDouble();
    double y = rng.nextInt(12).toDouble();
    double correct;

    switch (rng.nextInt(4)) {
      case 0:
        _operator = '+';
        correct = (x + y).toDouble();
        break;
      case 1:
        _operator = '-';
        correct = (x - y).toDouble();
        break;
      case 2:
        _operator = '*';
        correct = (x * y).toDouble();
        break;
      case 3:
        _operator = '÷';
        correct = x / y;
        break;
      default:
    }

    _setBuffer(correct);

    return [x, y, correct];
  }

  void _reset() {
    _generateQuestion();
    setState(() {
      _score = 0;
      _totalAnswers = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(height: 20),
              Text(
                'Question: $_question',
                style: TextStyle(fontSize: 20),
              ),
              Text('Score: $_score / $_totalAnswers',
                  style: TextStyle(fontSize: 16)),
              Expanded(
                  child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                    4,
                    (index) => Center(
                          child: GestureDetector(
                            onTap: () => _verifyAnswer(_buffer[index]),
                            child: Container(
                                width: 80,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.blue[200],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Center(
                                  child: Text(
                                    '${_buffer[index]}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                )),
                          ),
                        )),
              )),
              GestureDetector(
                onTap: () => _reset(),
                child: Center(
                  child: Container(
                      child: Text('Reset'),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.blue[200],
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              GestureDetector(
                  onTap: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Level1()))
                      },
                  child: Text('level 1')),
              Container(height: 20)
            ],
          ),
        ));
  }
}
