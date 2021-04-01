import 'dart:math';
import 'package:flutter/foundation.dart';
import '../models/data.dart';
import 'package:http/http.dart' as http;

class Services with ChangeNotifier, DiagnosticableTreeMixin {
  List<Tion> questions;

  final Uri uri = Uri.parse('https://api.jsonbin.io/b/6064a26818592d461f042f03');

  void loadQuestions() async {
    try {
      final res = await http.get(uri);
      if (res.statusCode == 200) {
        final Data data = dataFromJson(res.body);
        getQuestions(data);
      }
    } catch (err) {
      print(err);
    }
  }

  void getQuestions(Data data) {
    final mapData = _toMap(data);
    final rng = new Random();
    Map<String, String> map = Map.unmodifiable({
      '1': 'addition',
      '2': 'substraction',
      '3': 'multiplication',
      // '4': 'division'
    });
    
    List<Tion> res = [];

    for (var i = 0; i < 2; i++) {
      final questionType = rng.nextInt(3) + 1; // change to 5 when divisions are done
      final questionNumber = rng.nextInt(100);

      res.add(mapData[map[questionType.toString()].toString()][questionNumber]);
    }

    questions = res;

    notifyListeners();
  }

  static Map<String, List<Tion>> _toMap(Data data) {
    return {
      'addition': data.addition,
      'substraction': data.substraction,
      'multiplication': data.multiplication,
      // 'division': data.division
    };
  }
}