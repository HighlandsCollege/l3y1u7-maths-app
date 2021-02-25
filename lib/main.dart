import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _correct = 0;
  int _score = 0;
  List<int> _buffer = [];

  @override
  void initState() {
    _generateQuestion();
    super.initState();
  }

  Future<void> _generateQuestion() async {
    List<int> list = await _randomInt();
    setState(() {
      _question = 'What is ${list[0]} + ${list[1]}?';
      _correct = list[2];
    });
  }

  void _verifyAnswer(int answer) {
    if (answer == _correct) {
      setState(() {
        _score++;
      });
    }

    _generateQuestion();
  }

  void _setBuffer (int correct) async {
    var rng = new Random();
    List<int> buffer = [];

    for (var i = 0; i < 4; i++) {
      buffer.add(rng.nextInt(20));
    }

    buffer[rng.nextInt(3)] = correct;

    setState(() {
      _buffer = buffer;
    });
  }

  Future<List<int>> _randomInt() async {
    var rng = new Random();
    int x = rng.nextInt(20);
    int y = rng.nextInt(20);
    int correct = x + y;

    _setBuffer(correct);

    return [x, y, correct];
  }

  void _reset() {
    _generateQuestion();
    setState(() {
      _score = 0;
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
            Text(
                'Score: $_score'
            ),
            Text(
                'Question: $_question'
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(4, (index) => Center(
                  child: GestureDetector(
                    onTap: () => _verifyAnswer(_buffer[index]),
                    child: Container(
                      width: 80,
                      height: 50,
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          '${_buffer[index]}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          ),
                        ),
                      )
                    ),
                  ),
                )),
              )
            ),
            GestureDetector(
              onTap: () => _reset(),
              child: Center(
                child: Text('Reset'),
              ),
            )
          ],
        ),
      )
    );
  }
}
