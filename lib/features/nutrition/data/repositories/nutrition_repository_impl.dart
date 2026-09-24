import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/entities/food_item.dart';
import '../../domain/repositories/nutrition_repository.dart';
import '../datasources/nutrition_local_datasource.dart';

class NutritionRepositoryImpl implements NutritionRepository {
  const NutritionRepositoryImpl({required this.datasource});

  final NutritionLocalDatasource datasource;

  @override
  Future<List<FoodItem>> getFoods([AppLocalizations? l10n]) async =>
      datasource.getFoods(l10n);

  @override
  Future<List<FoodItem>> getFoodsByCategory(FoodCategory category,
          [AppLocalizations? l10n]) async =>
      datasource.getFoodsByCategory(category, l10n);
}
