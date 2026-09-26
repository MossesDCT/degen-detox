import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:degen_detox/degen/app.dart';
import 'package:degen_detox/degen/strings.dart';

void main() {
  for (final locale in languages) {
    testWidgets('home and settings render without overflow in $locale',
        (tester) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      SharedPreferences.setMockInitialValues({'degen_language': locale});
      await tester.pumpWidget(const DegenApp());
      await tester.pumpAndSettle();
      expect(find.text('degen detox'), findsOneWidget);
      expect(find.text(tr('headline', locale)), findsOneWidget);
      expect(tester.takeException(), isNull);
      await tester.tap(find.text(tr('settings', locale)).last);
      await tester.pumpAndSettle();
      expect(find.text(tr('privacy', locale)), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
    testWidgets('lifetime paywall fits phone in $locale', (tester) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      SharedPreferences.setMockInitialValues({'degen_language': locale});
      await tester.pumpWidget(const DegenApp());
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text(tr('configure', locale)));
      await tester.tap(find.text(tr('configure', locale)));
      await tester.pumpAndSettle();
      expect(find.text(tr('noSubscription', locale)), findsOneWidget);
      expect(find.text('500 SKR'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }
  testWidgets('free user sees a clearly non-transactional paywall',
      (tester) async {
    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(const DegenApp());
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text(tr('configure', 'en')));
    await tester.tap(find.text(tr('configure', 'en')));
    await tester.pumpAndSettle();
    expect(find.text(tr('noSubscription', 'en')), findsOneWidget);
    expect(find.text('Explore Pro preview'), findsNWidgets(2));
    expect(tester.takeException(), isNull);
  });
  testWidgets('Pro preview opens recipes and completes wind-down',
      (tester) async {
    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(const DegenApp());
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text(tr('configure', 'en')));
    await tester.tap(find.text(tr('configure', 'en')));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text(tr('demo', 'en')).last);
    await tester.pumpAndSettle();
    await tester.tap(find.text(tr('demo', 'en')).last);
    await tester.pumpAndSettle();
    await tester.tap(find.text(tr('rituals', 'en')).last);
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text(tr('recipes', 'en')).last);
    await tester.tap(find.text(tr('recipes', 'en')).last);
    await tester.pumpAndSettle();
    expect(find.text(tr('foodNote', 'en')), findsOneWidget);
    await tester.tap(find.byType(ListTile).first);
    await tester.pumpAndSettle();
    expect(find.text(tr('ingredients', 'en').toUpperCase()), findsOneWidget);
    await tester.tap(find.byTooltip(tr('close', 'en')).last);
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip(tr('close', 'en')).last);
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text(tr('wind', 'en')).last);
    await tester.tap(find.text(tr('wind', 'en')).last);
    await tester.pumpAndSettle();
    for (var i = 1; i <= 3; i++) {
      await tester.tap(find.text(tr('wind$i', 'en')));
      await tester.pumpAndSettle();
    }
    await tester.tap(find.text(tr('complete', 'en')));
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.check_circle_outline), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
