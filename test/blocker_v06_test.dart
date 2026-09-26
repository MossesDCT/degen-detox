import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:degen_detox/degen/blocker_apps.dart';
import 'package:degen_detox/degen/permission_guide.dart';
import 'package:degen_detox/degen/strings.dart';
import 'package:degen_detox/features/pro/app_blocker/data/app_blocker_service.dart';

const candidates = [
  InstalledApp(packageName: 'org.telegram.messenger', appName: 'Telegram'),
  InstalledApp(packageName: 'com.binance.dev', appName: 'Binance'),
  InstalledApp(packageName: 'com.twitter.android', appName: 'X'),
  InstalledApp(packageName: 'com.binance.dev', appName: 'Binance'),
];

Widget host(Widget child) => MaterialApp(
    home: Scaffold(
        body: SingleChildScrollView(
            child: Padding(padding: const EdgeInsets.all(24), child: child))));

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('filter trims, ignores case, matches package, deduplicates and sorts',
      () {
    expect(filterBlockerApps(candidates, '  BIN ', {}, false).single.appName,
        'Binance');
    expect(filterBlockerApps(candidates, 'twitter', {}, false).single.appName,
        'X');
    expect(filterBlockerApps(candidates, '', {}, false).map((a) => a.appName),
        ['Binance', 'Telegram', 'X']);
    expect(
        filterBlockerApps(candidates, '', {'com.twitter.android'}, true)
            .single
            .appName,
        'X');
    expect(filterBlockerApps(candidates, 'absent', {}, false), isEmpty);
  });
  test('all picker and guide translations populated', () {
    for (final words in [...blockerWords.values, ...guideWords.values]) {
      expect(words.length, 6);
      expect(words.every((s) => s.trim().isNotEmpty), isTrue);
    }
  });
  for (final locale in languages) {
    testWidgets('search, selection across filters, deselect and save $locale',
        (tester) async {
      tester.view.physicalSize = const Size(360, 800);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      Set<String>? saved;
      await tester.pumpWidget(host(BlockerAppPicker(
          locale: locale,
          initialSelected: {'org.telegram.messenger'},
          loadApps: () async => candidates,
          onSave: (s, a) => saved = s)));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField), 'BIN');
      await tester.pumpAndSettle();
      expect(find.text('Telegram'), findsNothing);
      await tester.tap(find.widgetWithText(CheckboxListTile, 'Binance'));
      await tester.pumpAndSettle();
      expect(saved, isNull); // Draft only, not silently committed.
      await tester.enterText(find.byType(TextField), 'absent');
      await tester.pumpAndSettle();
      expect(find.text(blockerText('noMatches', locale)), findsOneWidget);
      await tester.tap(find.byTooltip(blockerText('clear', locale)));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FilterChip));
      await tester.pumpAndSettle();
      expect(find.text('X'), findsNothing);
      expect(find.text('Telegram'), findsOneWidget);
      await tester.tap(find.widgetWithText(CheckboxListTile, 'Telegram'));
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.byType(FilledButton));
      await tester.tap(find.byType(FilledButton));
      await tester.pumpAndSettle();
      expect(saved, {'com.binance.dev'});
      expect(tester.takeException(), isNull);
    });
  }
  testWidgets('load failure is retryable and cannot erase selection',
      (tester) async {
    var attempt = 0;
    await tester.pumpWidget(host(BlockerAppPicker(
        locale: 'en',
        initialSelected: {'com.twitter.android'},
        loadApps: () async {
          if (++attempt == 1) throw StateError('offline bridge');
          return candidates;
        },
        onSave: (_, apps) {})));
    await tester.pumpAndSettle();
    expect(find.text(blockerText('failed', 'en')), findsOneWidget);
    expect(tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
        isNull);
    await tester.tap(find.text(blockerText('retry', 'en')));
    await tester.pumpAndSettle();
    expect(
        tester
            .widget<CheckboxListTile>(
                find.widgetWithText(CheckboxListTile, 'X'))
            .value,
        isTrue);
  });
  testWidgets(
      'summary shows cached names before native lookup, including missing app',
      (tester) async {
    await tester.pumpWidget(host(const SelectedAppsSummary(
        locale: 'lt',
        selected: {'one', 'two'},
        apps: [],
        savedNames: {'one': 'Binance', 'two': 'Telegram'})));
    expect(find.text('Binance'), findsOneWidget);
    expect(find.text('Telegram'), findsOneWidget);
    expect(find.text('Pasirinktos programėlės · 2'), findsOneWidget);
  });
  testWidgets(
      'restricted instructions are conditional; direct App info and resumed state',
      (tester) async {
    const channel = MethodChannel('com.degendetox.app/app_blocker');
    var enabled = false, opened = 0;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
      if (call.method == 'checkPermissions') {
        return {
          'hasAccessibilityPermission': enabled,
          'serviceConnected': enabled
        };
      }
      if (call.method == 'openAppDetails') opened++;
      return true;
    });
    addTearDown(() => TestDefaultBinaryMessengerBinding
        .instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null));
    await tester.pumpWidget(
        host(PermissionGuide(locale: 'lt', native: AppBlockerNativeService())));
    await tester.pumpAndSettle();
    expect(find.text(guideText('appInfo', 'lt')), findsNothing);
    await tester.ensureVisible(find.text(guideText('helpButton', 'lt')));
    await tester.tap(find.text(guideText('helpButton', 'lt')));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text(guideText('appInfo', 'lt')));
    await tester.tap(find.text(guideText('appInfo', 'lt')));
    await tester.pumpAndSettle();
    expect(opened, 1);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pumpAndSettle();
    expect(find.text(guideText('stepEnable', 'lt')), findsOneWidget);
    // Returning from App info does NOT imply accessibility is granted.
    expect(find.text(guideText('off', 'lt')), findsOneWidget);
    enabled = true;
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pumpAndSettle();
    expect(find.text(guideText('ready', 'lt')), findsOneWidget);
    expect(find.byType(CheckboxListTile), findsNothing);
  });
}
