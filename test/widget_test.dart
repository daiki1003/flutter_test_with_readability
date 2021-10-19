import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_ui/flutter_test_ui.dart';
import 'package:readable_test/main.dart';

import 'widget_test_helper.dart';

void main() {
  setUpUI((tester) async {
    await tester.pumpWidget(const MyApp());
  });

  group('[Increment Button]', () {
    group('label shows "0"', () {
      testUI(
        'label shows "1"',
        harness((given, when, then) async {
          {
            given.canFindZero();
            given.cannotFindOne();
          }

          {
            await when.userTapsIncrementButton();
          }

          {
            then.cannotFindZero();
            then.canFindOne();
          }
        }),
      );
    });

    group('label shows "1"', () {
      setUpUI((tester) async {
        await tester.tap(find.byKey(incrementKey));
        await tester.pump();
      });

      testUI(
        'label shows "2"',
        harness((given, when, then) async {
          {
            given.canFindOne();
            given.cannotFindTwo();
          }

          {
            await when.userTapsIncrementButton();
          }

          {
            then.cannotFindOne();
            then.canFindTwo();
          }
        }),
      );
    });
  });

  group('[Decrement Button]', () {
    group('label shows "1"', () {
      setUpUI((tester) async {
        await tester.tap(find.byKey(incrementKey));
        await tester.pump();
      });

      testUI(
        'label shows "0"',
        harness((given, when, then) async {
          {
            given.canFindOne();
            given.cannotFindZero();
          }

          {
            await when.userTapsDecrementButton();
          }

          {
            then.cannotFindOne();
            then.canFindZero();
          }
        }),
      );
    });

    group('label shows "2"', () {
      setUpUI((tester) async {
        await tester.tap(find.byKey(incrementKey));
        await tester.tap(find.byKey(incrementKey));
        await tester.pump();
      });

      testUI(
        'label shows "1"',
        harness((given, when, then) async {
          {
            given.canFindTwo();
            given.cannotFindOne();
          }

          {
            await when.userTapsDecrementButton();
          }

          {
            then.cannotFindTwo();
            then.canFindOne();
          }
        }),
      );
    });
  });
}
