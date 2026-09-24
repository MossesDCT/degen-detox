import '../../../../l10n/generated/app_localizations.dart';
import '../entities/food_item.dart';
import '../repositories/nutrition_repository.dart';

class GetNutritionGuide {
  const GetNutritionGuide({required this.repository});

  final NutritionRepository repository;

  Future<List<FoodItem>> call([AppLocalizations? l10n]) =>
      repository.getFoods(l10n);

  Future<List<FoodItem>> byCategory(FoodCategory category,
          [AppLocalizations? l10n]) =>
      repository.getFoodsByCategory(category, l10n);
}
