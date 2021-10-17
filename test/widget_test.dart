import 'package:flutter_test/flutter_test.dart';

import 'package:readable_test/main.dart';

void main() {
  group('[Increment Button]', () {
    group('label shows "0"', () {
      testWidgets('label shows "1"', (WidgetTester tester) async {
        await tester.pumpWidget(const MyApp());

        expect(find.text('0'), findsOneWidget);
        expect(find.text('1'), findsNothing);

        await tester.tap(find.byKey(incrementKey));
        await tester.pump();

        expect(find.text('0'), findsNothing);
        expect(find.text('1'), findsOneWidget);
      });
    });

    group('label shows "1"', () {
      testWidgets('label shows "2"', (WidgetTester tester) async {
        await tester.pumpWidget(const MyApp());

        await tester.tap(find.byKey(incrementKey));
        await tester.pump();

        expect(find.text('1'), findsOneWidget);
        expect(find.text('2'), findsNothing);

        await tester.tap(find.byKey(incrementKey));
        await tester.pump();

        expect(find.text('1'), findsNothing);
        expect(find.text('2'), findsOneWidget);
      });
    });
  });

  group('[Decrement Button]', () {
    group('label shows "1"', () {
      testWidgets('label shows "0"', (WidgetTester tester) async {
        await tester.pumpWidget(const MyApp());

        await tester.tap(find.byKey(incrementKey));
        await tester.pump();

        expect(find.text('1'), findsOneWidget);
        expect(find.text('0'), findsNothing);

        await tester.tap(find.byKey(decrementKey));
        await tester.pump();

        expect(find.text('0'), findsOneWidget);
        expect(find.text('1'), findsNothing);
      });
    });

    group('label shows "2"', () {
      testWidgets('label shows "1"', (WidgetTester tester) async {
        await tester.pumpWidget(const MyApp());

        await tester.tap(find.byKey(incrementKey));
        await tester.tap(find.byKey(incrementKey));
        await tester.pump();

        expect(find.text('2'), findsOneWidget);
        expect(find.text('1'), findsNothing);

        await tester.tap(find.byKey(decrementKey));
        await tester.pump();

        expect(find.text('2'), findsNothing);
        expect(find.text('1'), findsOneWidget);
      });
    });
  });
}
