import 'package:flutter_test/flutter_test.dart';
import '../lib/views/level_1.dart';
import 'utils/test_wrapper.dart';

void main() {
  testWidgets('Finds the correct title', (WidgetTester tester) async {
    await tester.pumpWidget(
      createWidgetToTest(Level1())
    );

    final titleFinder = find.text('Level 1');

    expect(titleFinder, findsOneWidget);
  });
}