import '../entities/recipe.dart';

abstract class RecipeRepository {
  Future<List<Recipe>> getRecipes({String locale = 'en'});
  Future<List<Recipe>> getRecipesByCategory(RecipeCategory category,
      {String locale = 'en'});
  Future<Recipe?> getRecipeById(String id, {String locale = 'en'});
}
