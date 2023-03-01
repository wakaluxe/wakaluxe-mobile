import 'package:flutter_test/flutter_test.dart';
import 'package:wakaluxe/app/app.dart';
import 'package:wakaluxe/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const Wakaluxe());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
