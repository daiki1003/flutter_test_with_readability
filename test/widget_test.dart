import 'package:flutter_test/flutter_test.dart';

import 'package:readable_test/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byKey(incrementKey));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Counter increments smoke test 2', (WidgetTester tester) async {
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

  testWidgets('Counter decrements smoke test', (WidgetTester tester) async {
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

  testWidgets('Counter decrements smoke test 2', (WidgetTester tester) async {
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
}
