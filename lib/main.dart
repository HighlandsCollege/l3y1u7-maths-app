import 'package:app/services/data.dart';
import 'package:app/services/score.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'views/start.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataHandler()),
        ChangeNotifierProvider(create: (context) => ScoreHandler()),
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // @override
  // void didChangeDependencies() {
  //   context.read<DataHandler>()?.loadQuestions();

  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Maths App',
      home: Start()
    );
  }
}

