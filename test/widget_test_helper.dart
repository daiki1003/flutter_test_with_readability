import 'package:flutter_test/flutter_test.dart';
import 'package:given_when_then/given_when_then.dart';

import 'package:readable_test/main.dart';

Future<void> Function(WidgetTester) harness(
  WidgetTestHarnessCallback<_MyAppTestHarness> callback,
) {
  return (tester) =>
      givenWhenThenWidgetTest(_MyAppTestHarness(tester), callback);
}

class _MyAppTestHarness extends WidgetTestHarness {
  _MyAppTestHarness(WidgetTester tester) : super(tester);
}

extension MyAppGiven on WidgetTestGiven<_MyAppTestHarness> {
  Future<void> pumpMyApp() async {
    await tester.pumpWidget(const MyApp());
  }

  Future<void> increment() async {
    await tester.tap(find.byKey(incrementKey));
  }

  Future<void> pump() async {
    await tester.pump();
  }

  void canFindZero() {
    expect(find.text('0'), findsOneWidget);
  }

  void cannotFindZero() {
    expect(find.text('0'), findsNothing);
  }

  void canFindOne() {
    expect(find.text('1'), findsOneWidget);
  }

  void cannotFindOne() {
    expect(find.text('1'), findsNothing);
  }

  void canFindTwo() {
    expect(find.text('2'), findsOneWidget);
  }

  void cannotFindTwo() {
    expect(find.text('2'), findsNothing);
  }
}

extension MyAppWhen on WidgetTestWhen<_MyAppTestHarness> {
  Future<void> userTapsIncrementButton() async {
    await tester.tap(find.byKey(incrementKey));
    await tester.pump();
  }

  Future<void> userTapsDecrementButton() async {
    await tester.tap(find.byKey(decrementKey));
    await tester.pump();
  }
}

extension MyAppThen on WidgetTestThen<_MyAppTestHarness> {
  void canFindZero() {
    expect(find.text('0'), findsOneWidget);
  }

  void cannotFindZero() {
    expect(find.text('0'), findsNothing);
  }

  void canFindOne() {
    expect(find.text('1'), findsOneWidget);
  }

  void cannotFindOne() {
    expect(find.text('1'), findsNothing);
  }

  void canFindTwo() {
    expect(find.text('2'), findsOneWidget);
  }

  void cannotFindTwo() {
    expect(find.text('2'), findsNothing);
  }
}
