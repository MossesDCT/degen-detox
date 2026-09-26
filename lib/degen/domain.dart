import '../features/pro/recipes/data/datasources/recipe_local_datasource.dart';
import '../features/pro/recipes/domain/entities/recipe.dart';
import 'strings.dart';
import 'ritual_strings.dart';

enum AccessTier { free, sol, skr }

/// Production access must come from a verified server entitlement.
/// Preview tier is never persisted and never authorizes native side effects.
class AccessPolicy {
  const AccessPolicy(
      {this.verified = AccessTier.free, this.preview = AccessTier.free});
  final AccessTier verified;
  final AccessTier preview;
  bool get pro => verified != AccessTier.free;
  bool get grass => verified == AccessTier.skr;
  bool get showPro => pro || preview != AccessTier.free;
  bool get showGrass => grass || preview == AccessTier.skr;
}

class MorningPlan {
  const MorningPlan(
      {required this.hour, required this.minute, required this.hours});
  final int hour, minute, hours;
  bool get valid =>
      hour >= 0 &&
      hour < 24 &&
      minute >= 0 &&
      minute < 60 &&
      hours >= 1 &&
      hours <= 4;
  DateTime startOn(DateTime day) =>
      DateTime(day.year, day.month, day.day, hour, minute);
  DateTime endOn(DateTime day) => startOn(day).add(Duration(hours: hours));
  bool contains(DateTime now) {
    final today = startOn(now);
    final yesterday = startOn(now.subtract(const Duration(days: 1)));
    return (!now.isBefore(today) &&
            now.isBefore(today.add(Duration(hours: hours)))) ||
        (!now.isBefore(yesterday) &&
            now.isBefore(yesterday.add(Duration(hours: hours))));
  }
}

List<Recipe> safeRecipes(String locale) => RecipeLocalDatasource()
    .getRecipes(locale: locale)
    .take(20)
    .map((r) => Recipe(
          id: r.id,
          name: r.name,
          description: tr('foodNote', locale),
          ingredients: [
            for (var i = 0; i < r.ingredients.length; i++)
              localizeRecipeMeasures(
                  // Do not carry inherited efficacy claims into ingredient labels.
                  r.id == 'recipe_004' && (i == 2 || i == 6)
                      ? r.ingredients[i].split(' (').first
                      : r.ingredients[i],
                  locale),
          ],
          instructions: r.instructions
              .map((text) => localizeRecipeMeasures(text, locale))
              .toList(),
          prepTimeMinutes: r.prepTimeMinutes,
          cookTimeMinutes: r.cookTimeMinutes,
          servings: r.servings,
          category: r.category,
          benefits: const [],
          emoji: '',
          tags: const [],
        ))
    .toList();

const evidence = {
  'cortisol': 'https://my.clevelandclinic.org/health/articles/22187-cortisol',
  'trading': 'https://pmc.ncbi.nlm.nih.gov/articles/PMC11815345/',
  'breath':
      'https://www.nhs.uk/mental-health/self-help/guides-tools-and-activities/breathing-exercises-for-stress/',
  'help': 'https://pmc.ncbi.nlm.nih.gov/articles/PMC11815345/',
  'nutrition':
      'https://www.nhs.uk/mental-health/feelings-symptoms-behaviours/feelings-and-symptoms/anxiety-fear-panic/',
};
