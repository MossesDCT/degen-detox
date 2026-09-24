import '../../../../l10n/generated/app_localizations.dart';
import '../entities/food_item.dart';

abstract class NutritionRepository {
  Future<List<FoodItem>> getFoods([AppLocalizations? l10n]);
  Future<List<FoodItem>> getFoodsByCategory(FoodCategory category,
      [AppLocalizations? l10n]);
}
