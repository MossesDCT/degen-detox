import 'package:flutter_test/flutter_test.dart';
import 'package:degen_detox/degen/domain.dart';
import 'package:degen_detox/degen/strings.dart';

void main() {
  test('preview does not authorize native paid operations', () {
    const p = AccessPolicy(preview: AccessTier.skr);
    expect(p.showPro, isTrue);
    expect(p.showGrass, isTrue);
    expect(p.pro, isFalse);
    expect(p.grass, isFalse);
  });
  test('SOL and SKR entitlements remain distinct', () {
    expect(const AccessPolicy(verified: AccessTier.sol).grass, isFalse);
    expect(const AccessPolicy(verified: AccessTier.sol).pro, isTrue);
    expect(const AccessPolicy(verified: AccessTier.skr).grass, isTrue);
  });
  test('morning duration bounds are 1 through 4 hours', () {
    expect(const MorningPlan(hour: 8, minute: 0, hours: 1).valid, isTrue);
    expect(const MorningPlan(hour: 8, minute: 0, hours: 4).valid, isTrue);
    expect(const MorningPlan(hour: 8, minute: 0, hours: 5).valid, isFalse);
    expect(const MorningPlan(hour: 25, minute: 0, hours: 2).valid, isFalse);
  });
  test('morning window supports midnight and excludes exact end', () {
    const p = MorningPlan(hour: 23, minute: 0, hours: 3);
    expect(p.contains(DateTime(2026, 9, 25, 1)), isTrue);
    expect(p.contains(DateTime(2026, 9, 25, 2)), isFalse);
    expect(p.contains(DateTime(2026, 9, 24, 22)), isFalse);
  });
  test('20 localized recipes, without inherited medical claims', () {
    for (final locale in languages) {
      final recipes = safeRecipes(locale);
      expect(recipes, hasLength(20));
      expect(recipes.map((r) => r.id).toSet(), hasLength(20));
      expect(
          recipes.every((r) => r.benefits.isEmpty && r.instructions.isNotEmpty),
          isTrue);
    }
  });
  test('all product strings translated into all six languages', () {
    for (final entry in words.entries) {
      expect(entry.value, hasLength(6), reason: entry.key);
      expect(entry.value.every((v) => v.trim().isNotEmpty), isTrue,
          reason: entry.key);
    }
  });
}
