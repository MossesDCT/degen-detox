import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/entities/education_snippet.dart';
import '../../domain/usecases/get_education_snippets.dart';

// ── Events ────────────────────────────────────────────────────────────────────

abstract class EducationEvent extends Equatable {
  const EducationEvent();

  @override
  List<Object?> get props => [];
}

class LoadEducationSnippets extends EducationEvent {
  const LoadEducationSnippets({this.l10n});

  final AppLocalizations? l10n;

  @override
  List<Object?> get props => [l10n];
}

class FilterByCategory extends EducationEvent {
  const FilterByCategory(this.category);

  final SnippetCategory? category; // null = all categories

  @override
  List<Object?> get props => [category];
}

class SearchSnippets extends EducationEvent {
  const SearchSnippets(this.query);

  final String query;

  @override
  List<Object?> get props => [query];
}

// ── States ────────────────────────────────────────────────────────────────────

abstract class EducationState extends Equatable {
  const EducationState();

  @override
  List<Object?> get props => [];
}

class EducationInitial extends EducationState {
  const EducationInitial();
}

class EducationLoading extends EducationState {
  const EducationLoading();
}

class EducationLoaded extends EducationState {
  const EducationLoaded({
    required this.snippets,
    required this.allSnippets,
    this.selectedCategory,
    this.searchQuery = '',
  });

  final List<EducationSnippet> snippets;
  final List<EducationSnippet> allSnippets;
  final SnippetCategory? selectedCategory;
  final String searchQuery;

  @override
  List<Object?> get props =>
      [snippets, allSnippets, selectedCategory, searchQuery];
}

class EducationError extends EducationState {
  const EducationError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

// ── BLoC ──────────────────────────────────────────────────────────────────────

class EducationBloc extends Bloc<EducationEvent, EducationState> {
  EducationBloc({required this.getSnippets}) : super(const EducationInitial()) {
    on<LoadEducationSnippets>(_onLoad);
    on<FilterByCategory>(_onFilter);
    on<SearchSnippets>(_onSearch);
  }

  final GetEducationSnippets getSnippets;

  Future<void> _onLoad(
      LoadEducationSnippets event, Emitter<EducationState> emit) async {
    emit(const EducationLoading());
    try {
      final snippets = await getSnippets(event.l10n);
      emit(EducationLoaded(
        snippets: snippets,
        allSnippets: snippets,
      ));
    } catch (e) {
      emit(EducationError(e.toString()));
    }
  }

  Future<void> _onFilter(
      FilterByCategory event, Emitter<EducationState> emit) async {
    final current = state;
    if (current is! EducationLoaded) return;

    List<EducationSnippet> filtered;
    if (event.category == null) {
      filtered = current.allSnippets;
    } else {
      filtered = current.allSnippets
          .where((s) => s.category == event.category)
          .toList();
    }

    emit(EducationLoaded(
      snippets: filtered,
      allSnippets: current.allSnippets,
      selectedCategory: event.category,
      searchQuery: current.searchQuery,
    ));
  }

  Future<void> _onSearch(
      SearchSnippets event, Emitter<EducationState> emit) async {
    final current = state;
    if (current is! EducationLoaded) return;

    final query = event.query.toLowerCase();
    List<EducationSnippet> filtered;

    if (query.isEmpty) {
      filtered = current.selectedCategory == null
          ? current.allSnippets
          : current.allSnippets
              .where((s) => s.category == current.selectedCategory)
              .toList();
    } else {
      filtered = current.allSnippets.where((s) {
        return s.title.toLowerCase().contains(query) ||
            s.content.toLowerCase().contains(query);
      }).toList();
    }

    emit(EducationLoaded(
      snippets: filtered,
      allSnippets: current.allSnippets,
      selectedCategory: current.selectedCategory,
      searchQuery: event.query,
    ));
  }
}
