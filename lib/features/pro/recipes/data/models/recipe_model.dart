import '../../domain/entities/recipe.dart';

class RecipeModel extends Recipe {
  const RecipeModel({
    required super.id,
    required super.name,
    required super.description,
    required super.ingredients,
    required super.instructions,
    required super.prepTimeMinutes,
    required super.cookTimeMinutes,
    required super.servings,
    required super.category,
    required super.benefits,
    required super.emoji,
    super.tags,
  });
}
