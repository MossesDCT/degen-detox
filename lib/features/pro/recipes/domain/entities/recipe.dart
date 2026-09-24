import 'package:equatable/equatable.dart';

enum RecipeCategory {
  breakfast,
  smoothie,
  salad,
  mainDish,
  snack,
  beverage,
  dessert,
  soup,
}

class Recipe extends Equatable {
  const Recipe({
    required this.id,
    required this.name,
    required this.description,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.category,
    required this.benefits,
    required this.emoji,
    this.tags = const [],
  });

  final String id;
  final String name;
  final String description;
  final List<String> ingredients;
  final List<String> instructions;
  final int prepTimeMinutes;
  final int cookTimeMinutes;
  final int servings;
  final RecipeCategory category;
  final List<String> benefits;
  final String emoji;
  final List<String> tags;

  String get totalTimeLabel {
    final total = prepTimeMinutes + cookTimeMinutes;
    return total < 60 ? '$total min' : '${total ~/ 60}h ${total % 60}min';
  }

  String get categoryName {
    switch (category) {
      case RecipeCategory.breakfast:
        return 'Breakfast';
      case RecipeCategory.smoothie:
        return 'Smoothie';
      case RecipeCategory.salad:
        return 'Salad';
      case RecipeCategory.mainDish:
        return 'Main Dish';
      case RecipeCategory.snack:
        return 'Snack';
      case RecipeCategory.beverage:
        return 'Beverage';
      case RecipeCategory.dessert:
        return 'Dessert';
      case RecipeCategory.soup:
        return 'Soup';
    }
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        ingredients,
        instructions,
        prepTimeMinutes,
        cookTimeMinutes,
        servings,
        category,
        benefits,
        emoji,
        tags
      ];
}
