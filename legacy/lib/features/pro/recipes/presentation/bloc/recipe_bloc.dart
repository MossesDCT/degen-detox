import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/recipe.dart';
import '../../domain/usecases/get_recipes.dart';

abstract class RecipeEvent extends Equatable {
  const RecipeEvent();
  @override
  List<Object?> get props => [];
}

class LoadRecipes extends RecipeEvent {
  const LoadRecipes({this.locale = 'en'});
  final String locale;
  @override
  List<Object?> get props => [locale];
}

class FilterRecipes extends RecipeEvent {
  const FilterRecipes(this.category);
  final RecipeCategory? category;
  @override
  List<Object?> get props => [category];
}

class SearchRecipes extends RecipeEvent {
  const SearchRecipes(this.query);
  final String query;
  @override
  List<Object?> get props => [query];
}

abstract class RecipeState extends Equatable {
  const RecipeState();
  @override
  List<Object?> get props => [];
}

class RecipeInitial extends RecipeState {
  const RecipeInitial();
}

class RecipeLoading extends RecipeState {
  const RecipeLoading();
}

class RecipeLoaded extends RecipeState {
  const RecipeLoaded({
    required this.recipes,
    required this.allRecipes,
    this.selectedCategory,
    this.searchQuery = '',
  });

  final List<Recipe> recipes;
  final List<Recipe> allRecipes;
  final RecipeCategory? selectedCategory;
  final String searchQuery;

  @override
  List<Object?> get props =>
      [recipes, allRecipes, selectedCategory, searchQuery];
}

class RecipeError extends RecipeState {
  const RecipeError(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  RecipeBloc({required this.getRecipes}) : super(const RecipeInitial()) {
    on<LoadRecipes>(_onLoad);
    on<FilterRecipes>(_onFilter);
    on<SearchRecipes>(_onSearch);
  }

  final GetRecipes getRecipes;

  Future<void> _onLoad(LoadRecipes event, Emitter<RecipeState> emit) async {
    emit(const RecipeLoading());
    try {
      final recipes = await getRecipes(locale: event.locale);
      emit(RecipeLoaded(recipes: recipes, allRecipes: recipes));
    } catch (e) {
      emit(RecipeError(e.toString()));
    }
  }

  Future<void> _onFilter(FilterRecipes event, Emitter<RecipeState> emit) async {
    final current = state;
    if (current is! RecipeLoaded) return;

    final filtered = event.category == null
        ? current.allRecipes
        : current.allRecipes
            .where((r) => r.category == event.category)
            .toList();

    emit(RecipeLoaded(
      recipes: filtered,
      allRecipes: current.allRecipes,
      selectedCategory: event.category,
    ));
  }

  Future<void> _onSearch(SearchRecipes event, Emitter<RecipeState> emit) async {
    final current = state;
    if (current is! RecipeLoaded) return;

    final query = event.query.toLowerCase();
    final filtered = query.isEmpty
        ? current.allRecipes
        : current.allRecipes
            .where((r) =>
                r.name.toLowerCase().contains(query) ||
                r.description.toLowerCase().contains(query) ||
                r.tags.any((t) => t.contains(query)))
            .toList();

    emit(RecipeLoaded(
      recipes: filtered,
      allRecipes: current.allRecipes,
      selectedCategory: current.selectedCategory,
      searchQuery: event.query,
    ));
  }
}
