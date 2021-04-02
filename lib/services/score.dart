import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ScoreHandler with ChangeNotifier, DiagnosticableTreeMixin {
  int _score = 0;

  int get score => _score;

  void increment() {
    _score++;
    notifyListeners();
  }

  void initScore() {
    _score = 0;
  }
}
