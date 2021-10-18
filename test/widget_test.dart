import 'package:flutter_test/flutter_test.dart';

import 'widget_test_helper.dart';

void main() {
  group('[Increment Button]', () {
    group('label shows "0"', () {
      testWidgets(
        'label shows "1"',
        harness((given, when, then) async {
          {
            await given.pumpMyApp();
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
      testWidgets(
        'label shows "2"',
        harness((given, when, then) async {
          {
            await given.pumpMyApp();
            await given.increment();
            await given.pump();

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
      testWidgets(
        'label shows "0"',
        harness((given, when, then) async {
          {
            await given.pumpMyApp();
            await given.increment();
            await given.pump();

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
      testWidgets(
        'label shows "1"',
        harness((given, when, then) async {
          {
            await given.pumpMyApp();
            await given.increment();
            await given.increment();
            await given.pump();

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
