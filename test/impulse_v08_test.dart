import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:degen_detox/degen/impulse_insights.dart';
import 'package:degen_detox/degen/home_intro.dart';
import 'package:degen_detox/degen/strings.dart';

final now = DateTime(2026, 9, 26, 23);
Map<String, dynamic> entry(int hour, int score, {int day = 25}) => {
      'date': DateTime(2026, 9, day, hour).toIso8601String(),
      'urge': score,
      'hourLocal': hour,
      'note': 'FOMO'
    };

void main() {
  test('three records unlock descriptive summary, not time claims', () {
    final data =
        UrgeInsights([entry(8, 2), entry(19, 7), entry(20, 9)], now: now);
    expect(data.ready, isTrue);
    expect(data.mean, 6);
    expect(data.canCompare, isFalse);
    expect(data.high, isEmpty);
  });
  test('five records compare only buckets with at least two observations', () {
    final data = UrgeInsights(
        [entry(8, 2), entry(9, 4), entry(19, 7), entry(20, 9), entry(14, 10)],
        now: now);
    expect(data.canCompare, isTrue);
    expect(data.high, [3]);
    expect(data.low, [1]);
    expect(data.bucketMean(3), 8);
    expect(data.comparable, [1, 3]);
  });
  test('same bucket, equal means and tied peaks are not invented patterns', () {
    expect(
        UrgeInsights(List.generate(5, (_) => entry(9, 5)), now: now).canCompare,
        isFalse);
    final equal = UrgeInsights(
        [entry(8, 5), entry(9, 5), entry(19, 5), entry(20, 5), entry(14, 5)],
        now: now);
    expect(equal.equal, isTrue);
    final tied = UrgeInsights([
      entry(8, 2),
      entry(9, 2),
      entry(14, 8),
      entry(15, 8),
      entry(19, 8),
      entry(20, 8)
    ], now: now);
    expect(tied.high, [2, 3]);
    expect(tied.low, [1]);
  });
  test('ignores corrupt, out-of-window, future and out-of-range entries', () {
    final data = UrgeInsights([
      entry(9, 5),
      {'date': 'bad', 'urge': 2},
      entry(10, 0),
      entry(10, 11),
      {...entry(9, 5), 'urge': '5'},
      {
        'date': now.subtract(const Duration(days: 31)).toIso8601String(),
        'urge': 8
      },
      {'date': now.add(const Duration(days: 1)).toIso8601String(), 'urge': 8},
    ], now: now);
    expect(data.records.length, 1);
  });
  test('legacy records survive and recorded local hour is retained', () {
    final data = UrgeInsights([
      {'date': DateTime(2026, 9, 24, 9).toIso8601String(), 'urge': 3},
      {...entry(20, 8), 'date': '2026-09-25T12:00:00.000Z'},
    ], now: now);
    expect(data.records.first.hour, 9);
    expect(data.records.last.hour, 20);
    expect(data.records.first.note, '');
  });
  for (final locale in languages) {
    testWidgets('insights and responsive forest hero in $locale',
        (tester) async {
      tester.view.physicalSize = const Size(360, 800);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final data = [
        entry(8, 2),
        entry(9, 4),
        entry(19, 7),
        entry(20, 9),
        entry(14, 5)
      ];
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(children: [
                        HomeIntro(slogan: tr('headline', locale)),
                        ImpulseInsightsPanel(
                            entries: data, locale: locale, now: now),
                      ]))))));
      await tester.pumpAndSettle();
      expect(find.text(tr('headline', locale)), findsOneWidget);
      expect(
          find.textContaining(insightText('higher', locale)), findsOneWidget);
      expect(find.text(insightText('limits', locale)), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }
  testWidgets('hero honours reduced motion and large text', (tester) async {
    tester.view.physicalSize = const Size(360, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(MaterialApp(
        home: MediaQuery(
            data: const MediaQueryData(
                disableAnimations: true, textScaler: TextScaler.linear(1.7)),
            child: Scaffold(
                body: SingleChildScrollView(
                    child: HomeIntro(slogan: tr('headline', 'lt')))))));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    expect(tester.binding.hasScheduledFrame, isFalse);
  });
}
