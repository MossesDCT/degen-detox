import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:degen_detox/degen/app.dart';
import 'package:degen_detox/degen/reminders.dart';
import 'package:degen_detox/degen/grass_sound_strings.dart';
import 'package:degen_detox/degen/strings.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('com.degendetox.app/app_blocker');
  test('sound settings uses the explicit native channel settings route',
      () async {
    final calls = <String>[];
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
      calls.add(call.method);
      return true;
    });
    addTearDown(() => TestDefaultBinaryMessengerBinding
        .instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null));
    expect(await GrassReminders().openSoundSettings(), isTrue);
    expect(calls, ['openGrassNotificationSettings']);
  });
  test('settings failure is surfaced without an unhandled platform exception',
      () async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (_) async {
      throw PlatformException(code: 'NOTIFICATION_SETTINGS');
    });
    addTearDown(() => TestDefaultBinaryMessengerBinding
        .instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null));
    expect(await GrassReminders().openSoundSettings(), isFalse);
  });
  test('sound guidance exists in all six languages', () {
    for (final values in grassSoundWords.values) {
      expect(values.length, 6);
      expect(values.every((value) => value.isNotEmpty), isTrue);
    }
  });
  for (final locale in languages) {
    testWidgets('Touch Grass sound guidance fits phone in $locale',
        (tester) async {
      tester.view.physicalSize = const Size(360, 800);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      SharedPreferences.setMockInitialValues({'degen_language': locale});
      await tester.pumpWidget(const DegenApp());
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text(tr('configure', locale)));
      await tester.tap(find.text(tr('configure', locale)));
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text(tr('demo', locale)).last);
      await tester.tap(find.text(tr('demo', locale)).last);
      await tester.pumpAndSettle();
      await tester.tap(find.text(tr('rituals', locale)).last);
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text('Touch Grass'));
      await tester.tap(find.text('Touch Grass'));
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text(grassSoundText('sound', locale)));
      expect(find.text(grassSoundText('hint', locale)), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }
}
