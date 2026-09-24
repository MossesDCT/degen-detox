import '../entities/recipe.dart';
import '../repositories/recipe_repository.dart';

class GetRecipes {
  const GetRecipes({required this.repository});

  final RecipeRepository repository;

  Future<List<Recipe>> call({String locale = 'en'}) =>
      repository.getRecipes(locale: locale);

  Future<List<Recipe>> byCategory(RecipeCategory category,
          {String locale = 'en'}) =>
      repository.getRecipesByCategory(category, locale: locale);
}
