import 'dart:math';
import 'package:flutter/foundation.dart';
import '../models/data_model.dart';
import 'package:http/http.dart' as http;

class DataHandler with ChangeNotifier, DiagnosticableTreeMixin {
  List<Tion> _questions;

  List<Tion> get questions => _questions;

  final Uri uri = Uri.parse('https://api.jsonbin.io/b/6064a26818592d461f042f03');

  void loadQuestions() async {
    try {
      final res = await http.get(uri);
      if (res.statusCode == 200) {
        final Data data = dataFromJson(res.body);
        parseQuestions(data);
      }
    } catch (err) {
      print(err);
    }
  }

  void parseQuestions(Data data) {
    final mapData = _toMap(data);
    final rng = new Random();
    Map<String, String> map = Map.unmodifiable({
      '1': 'addition',
      '2': 'substraction',
      '3': 'multiplication',
      // '4': 'division'
    });
    
    List<Tion> res = [];

    for (var i = 0; i < 30; i++) {
      final questionType = rng.nextInt(3) + 1; // change to 5 when divisions are done
      final questionNumber = rng.nextInt(100);

      res.add(mapData[map[questionType.toString()].toString()][questionNumber]);
    }

    _questions = res;

    notifyListeners();
  }

  Map<String, List<Tion>> _toMap(Data data) {
    return {
      'addition': data.addition,
      'substraction': data.substraction,
      'multiplication': data.multiplication,
      // 'division': data.division
    };
  }
}