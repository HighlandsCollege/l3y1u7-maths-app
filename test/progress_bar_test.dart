import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/views/level_1.dart';
import 'utils/widget_wrapper.dart';

void main() {
  testWidgets('Finds the correct title', (WidgetTester tester) async {
    await tester.pumpWidget(
      createWidgetToTest(Level1())
    );

    final titleFinder = find.text('Level 1');
    final questionFinder = find.text('Question: What is 4 + 9?');

    expect(titleFinder, findsOneWidget);
    expect(questionFinder, findsOneWidget);
  });
}