import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/entities/food_item.dart';
import '../../domain/usecases/get_nutrition_guide.dart';

// ── Events ────────────────────────────────────────────────────────────────────
abstract class NutritionEvent extends Equatable {
  const NutritionEvent();
  @override
  List<Object?> get props => [];
}

class LoadNutritionGuide extends NutritionEvent {
  const LoadNutritionGuide({this.l10n});
  final AppLocalizations? l10n;
  @override
  List<Object?> get props => [l10n];
}

class FilterFoodByCategory extends NutritionEvent {
  const FilterFoodByCategory(this.category);
  final FoodCategory? category;
  @override
  List<Object?> get props => [category];
}

// ── States ────────────────────────────────────────────────────────────────────
abstract class NutritionState extends Equatable {
  const NutritionState();
  @override
  List<Object?> get props => [];
}

class NutritionInitial extends NutritionState {
  const NutritionInitial();
}

class NutritionLoading extends NutritionState {
  const NutritionLoading();
}

class NutritionLoaded extends NutritionState {
  const NutritionLoaded({
    required this.foods,
    required this.allFoods,
    this.selectedCategory,
  });

  final List<FoodItem> foods;
  final List<FoodItem> allFoods;
  final FoodCategory? selectedCategory;

  @override
  List<Object?> get props => [foods, allFoods, selectedCategory];
}

class NutritionError extends NutritionState {
  const NutritionError(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}

// ── BLoC ──────────────────────────────────────────────────────────────────────
class NutritionBloc extends Bloc<NutritionEvent, NutritionState> {
  NutritionBloc({required this.getNutritionGuide})
      : super(const NutritionInitial()) {
    on<LoadNutritionGuide>(_onLoad);
    on<FilterFoodByCategory>(_onFilter);
  }

  final GetNutritionGuide getNutritionGuide;

  Future<void> _onLoad(
      LoadNutritionGuide event, Emitter<NutritionState> emit) async {
    emit(const NutritionLoading());
    try {
      final foods = await getNutritionGuide(event.l10n);
      emit(NutritionLoaded(foods: foods, allFoods: foods));
    } catch (e) {
      emit(NutritionError(e.toString()));
    }
  }

  Future<void> _onFilter(
      FilterFoodByCategory event, Emitter<NutritionState> emit) async {
    final current = state;
    if (current is! NutritionLoaded) return;

    final filtered = event.category == null
        ? current.allFoods
        : current.allFoods.where((f) => f.category == event.category).toList();

    emit(NutritionLoaded(
      foods: filtered,
      allFoods: current.allFoods,
      selectedCategory: event.category,
    ));
  }
}
