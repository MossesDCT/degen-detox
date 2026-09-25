import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:degen_detox/degen/education.dart';
import 'package:degen_detox/degen/permission_guide.dart';
import 'package:degen_detox/degen/strings.dart';
import 'package:degen_detox/features/pro/app_blocker/data/app_blocker_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('com.degendetox.app/app_blocker');
  test('eight evidence-linked articles and all six languages complete', () {
    expect(educationArticles.length, 8);
    expect(educationArticles.map((a) => a.id).toSet().length, 8);
    for (final a in educationArticles) {
      for (final translations in [a.titles, a.intros, a.bodies, a.actions]) {
        expect(translations.length, 6);
        expect(translations.every((t) => t.trim().isNotEmpty), isTrue);
      }
      expect(a.sources.isNotEmpty, isTrue);
      expect(a.sources.values.every((u) => Uri.parse(u).scheme == 'https'),
          isTrue);
    }
    for (final words in [...guideWords.values, ...educationWords.values]) {
      expect(words.length, 6);
      expect(words.every((v) => v.isNotEmpty), isTrue);
    }
  });
  for (final locale in languages) {
    testWidgets('article fits at 390 px in $locale', (tester) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: ArticleBody(
                          article: educationArticles[6], locale: locale))))));
      await tester.pumpAndSettle();
      expect(find.text(educationArticles[6].body(locale)), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }
  for (final status in ['off', 'waiting', 'ready']) {
    testWidgets('permission state $status and explicit opt-in', (tester) async {
      var opened = 0;
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (call) async {
        if (call.method == 'checkPermissions') {
          return {
            'hasAccessibilityPermission': status != 'off',
            'serviceConnected': status == 'ready'
          };
        }
        if (call.method == 'requestAccessibilityPermission') opened++;
        return true;
      });
      addTearDown(() => TestDefaultBinaryMessengerBinding
          .instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, null));
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: SingleChildScrollView(
                  child: PermissionGuide(
                      locale: 'en', native: AppBlockerNativeService())))));
      await tester.pumpAndSettle();
      expect(find.text(guideText(status, 'en')), findsOneWidget);
      final button =
          find.widgetWithText(FilledButton, guideText('access', 'en'));
      expect(tester.widget<FilledButton>(button).onPressed, isNull);
      await tester.ensureVisible(find.byType(CheckboxListTile));
      await tester.tap(find.byType(CheckboxListTile));
      await tester.pumpAndSettle();
      expect(tester.widget<FilledButton>(button).onPressed, isNotNull);
      await tester.ensureVisible(button);
      await tester.tap(button);
      await tester.pumpAndSettle();
      expect(opened, 1);
      expect(tester.takeException(), isNull);
    });
  }
}
