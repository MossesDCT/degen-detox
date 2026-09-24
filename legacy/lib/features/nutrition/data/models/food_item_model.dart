import '../../domain/entities/food_item.dart';

/// Data model for food item.
class FoodItemModel extends FoodItem {
  const FoodItemModel({
    required super.id,
    required super.name,
    required super.category,
    required super.emoji,
    required super.keyBenefit,
    required super.mechanism,
    required super.servingIdea,
    super.nutrients,
  });

  factory FoodItemModel.fromMap(Map<String, dynamic> map) {
    return FoodItemModel(
      id: map['id'] as String,
      name: map['name'] as String,
      category: FoodCategory.values.firstWhere(
        (e) => e.name == map['category'],
        orElse: () => FoodCategory.fruits,
      ),
      emoji: map['emoji'] as String,
      keyBenefit: map['keyBenefit'] as String,
      mechanism: map['mechanism'] as String,
      servingIdea: map['servingIdea'] as String,
      nutrients: (map['nutrients'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category.name,
      'emoji': emoji,
      'keyBenefit': keyBenefit,
      'mechanism': mechanism,
      'servingIdea': servingIdea,
      'nutrients': nutrients,
    };
  }
}
