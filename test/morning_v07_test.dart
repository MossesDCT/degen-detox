import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:degen_detox/degen/app.dart';
import 'package:degen_detox/degen/morning_shield.dart';
import 'package:degen_detox/degen/strict_strings.dart';
import 'package:degen_detox/degen/strings.dart';
import 'package:degen_detox/degen/payments.dart';
import 'package:degen_detox/degen/domain.dart';
import 'package:degen_detox/features/pro/app_blocker/data/app_blocker_service.dart';

class FakeNative extends AppBlockerNativeService {
  bool active = false, unavailable = false, rejectSave = false;
  int schedules = 0;
  @override
  Future<Map<String, dynamic>> getBlockState() async {
    if (unavailable) throw StateError('unavailable');
    return {
      'active': active,
      'serviceConnected': true,
      'endTimeMs':
          DateTime.now().add(const Duration(minutes: 42)).millisecondsSinceEpoch
    };
  }

  @override
  Future<Map<String, bool>> checkPermissions() async =>
      {'hasAccessibilityPermission': true, 'serviceConnected': true};
  @override
  Future<void> scheduleBlocking(
      {required List<String> blockedPackages,
      required int wakeHour,
      required int wakeMinute,
      required int durationHours}) async {
    schedules++;
    if (rejectSave) {
      active = true;
      throw PlatformException(code: 'BLOCK_ACTIVE');
    }
    active = true;
  }
}

Widget host(Widget w) => MaterialApp(
    home: Scaffold(
        body: SingleChildScrollView(
            child: Padding(padding: const EdgeInsets.all(24), child: w))));

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('new strings cover all languages', () {
    for (final values in strictWords.values) {
      expect(values.length, 6);
      expect(values.every((s) => s.isNotEmpty), isTrue);
    }
  });
  for (final locale in languages) {
    testWidgets(
        'numeric wake entry first-touch selection and valid save $locale',
        (tester) async {
      tester.view.physicalSize = const Size(360, 800);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      TimeOfDay? chosen;
      await tester.pumpWidget(MaterialApp(
          home: Builder(
              builder: (c) => Scaffold(
                  body: TextButton(
                      onPressed: () async {
                        chosen = await showDialog<TimeOfDay>(
                            context: c,
                            builder: (_) => WakeTimeDialog(
                                initial: const TimeOfDay(hour: 13, minute: 32),
                                locale: locale));
                      },
                      child: const Text('Open'))))));
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();
      expect(find.byType(TimePickerDialog), findsNothing);
      final minute = find.byKey(const ValueKey('wake-minute'));
      await tester.tap(minute);
      await tester.pumpAndSettle();
      expect(tester.widget<TextField>(minute).controller!.selection,
          const TextSelection(baseOffset: 0, extentOffset: 2));
      await tester.enterText(minute, '47');
      await tester.tap(find.byKey(const ValueKey('wake-hour')));
      await tester.enterText(find.byKey(const ValueKey('wake-hour')), '6');
      await tester.tap(find.text(tr('save', locale)));
      await tester.pumpAndSettle();
      expect(chosen, const TimeOfDay(hour: 6, minute: 47));
      expect(tester.takeException(), isNull);
    });
  }
  testWidgets(
      'invalid hours and minutes rejected, cancel preserves initial time',
      (tester) async {
    await tester.pumpWidget(host(const WakeTimeDialog(
        initial: TimeOfDay(hour: 13, minute: 32), locale: 'en')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const ValueKey('wake-hour')), '24');
    await tester.enterText(find.byKey(const ValueKey('wake-minute')), '60');
    await tester.tap(find.text(tr('save', 'en')));
    await tester.pumpAndSettle();
    expect(find.text(strictText('invalid', 'en')), findsOneWidget);
  });
  for (final locale in languages) {
    testWidgets(
        'active block has countdown and no editing or stop controls $locale',
        (tester) async {
      final native = FakeNative()..active = true;
      var reads = 0;
      await tester.pumpWidget(host(MorningShieldPanel(
        locale: locale,
        native: native,
        preview: false,
        initialWake: const TimeOfDay(hour: 8, minute: 0),
        initialHours: 2,
        initialSelected: const {'com.binance.dev'},
        initialNames: const {'com.binance.dev': 'Binance'},
        initialApps: const [],
        loadApps: () async {
          reads++;
          return [];
        },
        showSheet: (_, w) async {},
        permissions: () async {},
        onSaved: (_, h, s, n, a) async => fail('Cannot save active block'),
      )));
      await tester.pumpAndSettle();
      expect(find.text(strictText('active', locale)), findsOneWidget);
      expect(find.byType(ChoiceChip), findsNothing);
      expect(find.byType(FilledButton), findsNothing);
      expect(find.text(tr('stopBlocking', locale)), findsNothing);
      expect(reads, 0);
      native.active = false;
      await tester.pump(const Duration(seconds: 6));
      await tester.pumpAndSettle();
      expect(find.byType(ChoiceChip), findsNWidgets(4));
      await tester.pumpWidget(const SizedBox()); // Dispose the periodic timer.
    });
  }
  testWidgets(
      'status error fails closed, retry recovers without app enumeration',
      (tester) async {
    final native = FakeNative()..unavailable = true;
    await tester.pumpWidget(host(MorningShieldPanel(
      locale: 'en',
      native: native,
      preview: false,
      initialWake: const TimeOfDay(hour: 8, minute: 0),
      initialHours: 2,
      initialSelected: const {},
      initialNames: const {},
      initialApps: const [],
      loadApps: () async => throw StateError('must not enumerate on open'),
      showSheet: (_, w) async {},
      permissions: () async {},
      onSaved: (_, h, s, n, a) async {},
    )));
    await tester.pumpAndSettle();
    expect(find.text(strictText('stateError', 'en')), findsOneWidget);
    expect(find.byType(ChoiceChip), findsNothing);
    native.unavailable = false;
    await tester.tap(find.text('Try again'));
    await tester.pumpAndSettle();
    expect(find.byType(ChoiceChip), findsNWidgets(4));
    await tester.pumpWidget(const SizedBox());
  });
  testWidgets(
      'race at save is denied natively and does not persist Flutter settings',
      (tester) async {
    final native = FakeNative()..rejectSave = true;
    var saved = false;
    await tester.pumpWidget(host(MorningShieldPanel(
      locale: 'en',
      native: native,
      preview: false,
      initialWake: const TimeOfDay(hour: 8, minute: 0),
      initialHours: 2,
      initialSelected: const {'com.binance.dev'},
      initialNames: const {},
      initialApps: const [],
      loadApps: () async => [],
      showSheet: (_, w) async {},
      permissions: () async {},
      onSaved: (_, h, s, n, a) async => saved = true,
    )));
    await tester.pumpAndSettle();
    await tester
        .ensureVisible(find.widgetWithText(FilledButton, tr('save', 'en')));
    await tester.tap(find.widgetWithText(FilledButton, tr('save', 'en')));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 350));
    await tester.tap(find.text(strictText('accept', 'en')));
    await tester.pumpAndSettle();
    expect(saved, isFalse);
    expect(native.schedules, 1);
    expect(find.text(strictText('active', 'en')), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
  });
  testWidgets('Configure opens once, immediately, without installed-app scan',
      (tester) async {
    SharedPreferences.setMockInitialValues({});
    final receipt = PurchaseReceipt('owner', 'signature', AccessTier.sol);
    FlutterSecureStorage.setMockInitialValues(
        {'degen_mainnet_receipt_v1': jsonEncode(receipt.toJson())});
    var scans = 0;
    const channel = MethodChannel('com.degendetox.app/app_blocker');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (c) async {
      if (c.method == 'getInstalledApps') {
        scans++;
        return await Completer<List>().future;
      }
      if (c.method == 'getBlockState') {
        return {'active': false, 'serviceConnected': true, 'endTimeMs': 0};
      }
      return true;
    });
    addTearDown(() => TestDefaultBinaryMessengerBinding
        .instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null));
    await tester.pumpWidget(const DegenApp());
    await tester.pumpAndSettle();
    final configure = find.widgetWithText(FilledButton, tr('configure', 'en'));
    await tester.ensureVisible(configure);
    final press = tester.widget<FilledButton>(configure).onPressed!;
    press();
    press();
    press();
    await tester.pumpAndSettle();
    expect(find.byType(MorningShieldPanel), findsOneWidget);
    expect(scans, 0);
    await tester.pumpWidget(const SizedBox());
    FlutterSecureStorage.setMockInitialValues({});
  });
}
