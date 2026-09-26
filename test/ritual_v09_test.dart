import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:degen_detox/degen/domain.dart';
import 'package:degen_detox/degen/recipe_panel.dart';
import 'package:degen_detox/degen/ritual_store.dart';
import 'package:degen_detox/degen/ritual_strings.dart';
import 'package:degen_detox/degen/strings.dart';
import 'package:degen_detox/degen/wind_panel.dart';

Widget frame(Widget child) => MaterialApp(
    home: Scaffold(
        body: SingleChildScrollView(
            child: Padding(padding: const EdgeInsets.all(24), child: child))));

class FailingStore extends RitualStore {
  FailingStore() : super(persistent: false);
  @override
  Future<void> saveCustom(String text) async =>
      throw StateError('disk unavailable');
  @override
  Future<void> saveIngredients(String id, Set<int> checked) async =>
      throw StateError('disk unavailable');
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('all recipe quantities and method units localize in all six languages',
      () {
    for (final locale in languages) {
      final recipes = safeRecipes(locale);
      expect(recipes.length, 20);
      for (final recipe in recipes) {
        final text = [...recipe.ingredients, ...recipe.instructions].join('\n');
        if (locale != 'en') {
          expect(RegExp(r'\b(tbsp|tsp|cups?)\b').hasMatch(text), isFalse,
              reason: '$locale ${recipe.id}');
        }
      }
      final sample = localizeRecipeMeasures('½ tsp, 2 tbsp', locale);
      expect(sample.startsWith('½ '), isTrue);
      expect(sample.contains('2 '), isTrue);
      expect(
          safeRecipes(locale)
              .firstWhere((r) => r.id == 'recipe_004')
              .ingredients
              .join(),
          isNot(contains('2000%')));
    }
    expect(localizeRecipeMeasures('2 tbsp tahini', 'lt'), '2 valg. š. tahini');
    expect(localizeRecipeMeasures('물 2 tbsp을 넣는다', 'ko'), '물 2 큰술을 넣는다');
    expect(localizeRecipeMeasures('¼ cup씩', 'ko'), '¼ 컵씩');
    for (final value in ritualWords.values) {
      expect(value.length, 6);
      expect(value.every((s) => s.isNotEmpty), isTrue);
    }
  });
  test('persistent ingredient state is per-recipe and survives a new store',
      () async {
    SharedPreferences.setMockInitialValues({});
    final store = RitualStore(persistent: true);
    await store.saveIngredients('recipe_001', {0, 2});
    await store.saveIngredients('recipe_002', {1});
    await store.saveCustom('  Read 10 pages  ');
    final reloaded = RitualStore(persistent: true);
    expect(await reloaded.ingredients('recipe_001', 9), {0, 2});
    expect(await reloaded.ingredients('recipe_002', 7), {1});
    expect(await reloaded.custom(), 'Read 10 pages');
    await reloaded.saveIngredients('recipe_001', {});
    expect(await store.ingredients('recipe_001', 9), isEmpty);
    expect(await store.ingredients('recipe_002', 7), {1});
    await reloaded.saveCustom('');
    expect(await store.custom(), '');
  });
  test('corrupt indices ignored and preview memory does not persist', () async {
    SharedPreferences.setMockInitialValues({
      'degen_ingredients_v1_recipe_001': ['0', '0', '-1', '99', 'bad']
    });
    expect(
        await RitualStore(persistent: true).ingredients('recipe_001', 9), {0});
    final store = RitualStore(persistent: false);
    await store.saveCustom('Prayer');
    expect(await store.custom(), 'Prayer');
    expect(await RitualStore(persistent: false).custom(), '');
    expect(
        (await SharedPreferences.getInstance())
            .getString(RitualStore.customKey),
        isNull);
  });
  for (final locale in languages) {
    testWidgets(
        'ingredient tap strike-through undo reopen and reset in $locale',
        (tester) async {
      tester.view.physicalSize = const Size(360, 800);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final store = RitualStore(persistent: false);
      final recipe = safeRecipes(locale)[5];
      Future<void> open() => tester.pumpWidget(
          frame(RecipePanel(recipe: recipe, locale: locale, store: store)));
      await open();
      await tester.pumpAndSettle();
      final row = find.byKey(const ValueKey('ingredient-0'));
      await tester.ensureVisible(row);
      await tester.tap(row);
      await tester.pumpAndSettle();
      expect(tester.widget<CheckboxListTile>(row).value, isTrue);
      expect(
          tester
              .widget<Text>(find.text(recipe.ingredients.first))
              .style
              ?.decoration,
          TextDecoration.lineThrough);
      await tester.pumpWidget(const SizedBox());
      await open();
      await tester.pumpAndSettle();
      expect(tester.widget<CheckboxListTile>(row).value, isTrue);
      await tester.ensureVisible(row);
      await tester.tap(row);
      await tester.pumpAndSettle();
      expect(tester.widget<CheckboxListTile>(row).value, isFalse);
      await tester.tap(row);
      await tester.pumpAndSettle();
      final reset = find.text(ritualText('restart', locale));
      await tester.ensureVisible(reset);
      await tester.tap(reset);
      await tester.pumpAndSettle();
      expect(await store.ingredients(recipe.id, recipe.ingredients.length),
          isEmpty);
      expect(tester.takeException(), isNull);
    });
    testWidgets(
        'optional custom step saves validates completes edits removes in $locale',
        (tester) async {
      tester.view.physicalSize = const Size(360, 800);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final store = RitualStore(persistent: false);
      Future<void> tapText(String text) async {
        final finder = find.text(text).last;
        await tester.ensureVisible(finder);
        await tester.tap(finder);
        await tester.pumpAndSettle();
      }

      Future<void> open() =>
          tester.pumpWidget(frame(WindPanel(locale: locale, store: store)));
      await open();
      await tester.pumpAndSettle();
      await tapText(ritualText('addCustom', locale));
      await tapText(tr('save', locale));
      expect(find.text(ritualText('invalid', locale)), findsOneWidget);
      await tester.enterText(
          find.byKey(const ValueKey('custom-step-input')), '  Mano ritualas  ');
      await tapText(tr('save', locale));
      expect(await store.custom(), 'Mano ritualas');
      for (var i = 1; i <= 3; i++) {
        await tapText(tr('wind$i', locale));
      }
      FilledButton complete() => tester.widget<FilledButton>(
          find.widgetWithText(FilledButton, tr('complete', locale)));
      expect(complete().onPressed, isNull);
      await tapText('Mano ritualas');
      expect(complete().onPressed, isNotNull);
      await tapText(tr('complete', locale));
      expect(find.byIcon(Icons.check_circle_outline), findsOneWidget);
      await tester.pumpWidget(const SizedBox());
      await open();
      await tester.pumpAndSettle();
      expect(find.text('Mano ritualas'), findsOneWidget);
      expect(
          tester
              .widget<CheckboxListTile>(
                  find.byKey(const ValueKey('custom-step-checkbox')))
              .value,
          isFalse);
      expect(complete().onPressed, isNull);
      await tapText(ritualText('edit', locale));
      await tester.enterText(
          find.byKey(const ValueKey('custom-step-input')), 'Changed');
      await tapText(tr('cancel', locale));
      expect(await store.custom(), 'Mano ritualas');
      await tapText(ritualText('edit', locale));
      await tester.enterText(
          find.byKey(const ValueKey('custom-step-input')), 'Changed');
      await tapText(tr('save', locale));
      expect(await store.custom(), 'Changed');
      await tapText(ritualText('remove', locale));
      await tapText(tr('cancel', locale));
      expect(await store.custom(), 'Changed');
      await tapText(ritualText('remove', locale));
      await tapText(ritualText('remove', locale));
      expect(await store.custom(), '');
      expect(find.byKey(const ValueKey('custom-step-checkbox')), findsNothing);
      expect(tester.takeException(), isNull);
    });
  }
  testWidgets('failed writes do not claim saved custom step or ingredient',
      (tester) async {
    final store = FailingStore();
    await tester.pumpWidget(frame(WindPanel(locale: 'en', store: store)));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text(ritualText('addCustom', 'en')));
    await tester.tap(find.text(ritualText('addCustom', 'en')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'Read');
    await tester.ensureVisible(find.text('Save'));
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(find.text(ritualText('storageError', 'en')), findsOneWidget);
    expect(await store.custom(), '');
    await tester.pumpWidget(frame(RecipePanel(
        recipe: safeRecipes('en').first, locale: 'en', store: store)));
    await tester.pumpAndSettle();
    final row = find.byKey(const ValueKey('ingredient-0'));
    await tester.ensureVisible(row);
    await tester.tap(row);
    await tester.pumpAndSettle();
    expect(tester.widget<CheckboxListTile>(row).value, isFalse);
    expect(find.text(ritualText('storageError', 'en')), findsOneWidget);
  });
}
