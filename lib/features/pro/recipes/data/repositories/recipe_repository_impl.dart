import '../../domain/entities/recipe.dart';
import '../../domain/repositories/recipe_repository.dart';
import '../datasources/recipe_local_datasource.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  const RecipeRepositoryImpl({required this.datasource});

  final RecipeLocalDatasource datasource;

  @override
  Future<List<Recipe>> getRecipes({String locale = 'en'}) async =>
      datasource.getRecipes(locale: locale);

  @override
  Future<List<Recipe>> getRecipesByCategory(RecipeCategory category,
          {String locale = 'en'}) async =>
      datasource.getRecipesByCategory(category, locale: locale);

  @override
  Future<Recipe?> getRecipeById(String id, {String locale = 'en'}) async {
    try {
      return datasource
          .getRecipes(locale: locale)
          .firstWhere((r) => r.id == id);
    } catch (_) {
      return null;
    }
  }
}
