import 'package:bs58/bs58.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:degen_detox/degen/app.dart';
import 'package:degen_detox/degen/payments.dart';
import 'package:degen_detox/degen/strings.dart';

void main() {
  test('v0.4 routes payments to the exact requested 32-byte address', () {
    expect(merchant, '6vqJTwDWoNXauztA3e8psbnrm4bNWFDAG218NbAMPgaG');
    expect(base58.decode(merchant).length, 32);
    expect(solPrice, 100000000);
    expect(skrPrice, 500000000);
  });
  for (final locale in languages) {
    testWidgets('free before Pro before SKR on both screens in $locale',
        (tester) async {
      tester.view.physicalSize = const Size(360, 800);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      SharedPreferences.setMockInitialValues({'degen_language': locale});
      await tester.pumpWidget(const DegenApp());
      await tester.pumpAndSettle();
      void checkOrder() {
        final names = [
          'breathe',
          'impulse',
          'learn',
          'morning',
          'recipes',
          'wind'
        ];
        var previous = -double.infinity;
        for (final name in names) {
          final y = tester.getTopLeft(find.text(tr(name, locale)).first).dy;
          expect(y, greaterThan(previous),
              reason: '$name must follow the previous feature');
          previous = y;
        }
        expect(tester.getTopLeft(find.text('Touch Grass').first).dy,
            greaterThan(previous));
      }

      expect(find.text(tr('headline', locale)), findsOneWidget);
      expect(words.containsKey('eyebrow'), isFalse);
      expect(words.containsKey('intro'), isFalse);
      checkOrder();
      await tester.ensureVisible(find.text('Touch Grass').first);
      await tester.tap(find.text(tr('rituals', locale)).last);
      await tester.pumpAndSettle();
      checkOrder();
      expect(find.text(tr('headline', locale)), findsNothing);
      expect(tester.getTopLeft(find.text(tr('breathe', locale))).dy,
          lessThan(400));
      expect(tester.takeException(), isNull);
    });
  }
}
