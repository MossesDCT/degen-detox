import 'package:equatable/equatable.dart';

/// Food categories for the nutrition guide.
enum FoodCategory {
  fruits,
  vegetables,
  proteins,
  beverages,
  nutsAndSeeds,
  grains,
  dairy,
  spices,
}

/// Domain entity for an anti-stress food item.
class FoodItem extends Equatable {
  const FoodItem({
    required this.id,
    required this.name,
    required this.category,
    required this.emoji,
    required this.keyBenefit,
    required this.mechanism,
    required this.servingIdea,
    this.nutrients = const [],
  });

  final String id;
  final String name;
  final FoodCategory category;
  final String emoji;
  final String keyBenefit;
  final String mechanism; // How it lowers cortisol
  final String servingIdea;
  final List<String> nutrients;

  String get categoryName {
    switch (category) {
      case FoodCategory.fruits:
        return 'Fruits';
      case FoodCategory.vegetables:
        return 'Vegetables';
      case FoodCategory.proteins:
        return 'Proteins';
      case FoodCategory.beverages:
        return 'Beverages';
      case FoodCategory.nutsAndSeeds:
        return 'Nuts & Seeds';
      case FoodCategory.grains:
        return 'Grains';
      case FoodCategory.dairy:
        return 'Dairy';
      case FoodCategory.spices:
        return 'Spices';
    }
  }

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        emoji,
        keyBenefit,
        mechanism,
        servingIdea,
        nutrients
      ];
}
