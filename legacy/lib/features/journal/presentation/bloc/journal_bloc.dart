import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/journal_entry.dart';
import '../../domain/usecases/journal_usecases.dart';

// ── Events ────────────────────────────────────────────────────────────────────

abstract class JournalEvent extends Equatable {
  const JournalEvent();
  @override
  List<Object?> get props => [];
}

class LoadJournalEntries extends JournalEvent {
  const LoadJournalEntries();
}

class LoadMonthEntries extends JournalEvent {
  const LoadMonthEntries({required this.year, required this.month});
  final int year;
  final int month;
  @override
  List<Object?> get props => [year, month];
}

class AddEntry extends JournalEvent {
  const AddEntry({required this.mood, this.note, this.tags = const []});
  final MoodLevel mood;
  final String? note;
  final List<String> tags;
  @override
  List<Object?> get props => [mood, note, tags];
}

class UpdateEntry extends JournalEvent {
  const UpdateEntry(this.entry);
  final JournalEntry entry;
  @override
  List<Object?> get props => [entry];
}

class DeleteEntry extends JournalEvent {
  const DeleteEntry(this.id);
  final String id;
  @override
  List<Object?> get props => [id];
}

class ChangeMonth extends JournalEvent {
  const ChangeMonth({required this.year, required this.month});
  final int year;
  final int month;
  @override
  List<Object?> get props => [year, month];
}

// ── States ────────────────────────────────────────────────────────────────────

abstract class JournalState extends Equatable {
  const JournalState();
  @override
  List<Object?> get props => [];
}

class JournalInitial extends JournalState {
  const JournalInitial();
}

class JournalLoading extends JournalState {
  const JournalLoading();
}

class JournalLoaded extends JournalState {
  const JournalLoaded({
    required this.entries,
    required this.displayYear,
    required this.displayMonth,
    this.moodSummary = const {},
    this.weeklyAverage,
  });

  final List<JournalEntry> entries;
  final int displayYear;
  final int displayMonth;
  final Map<String, int> moodSummary; // date string -> mood value
  final double? weeklyAverage;

  @override
  List<Object?> get props =>
      [entries, displayYear, displayMonth, moodSummary, weeklyAverage];
}

class JournalError extends JournalState {
  const JournalError(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}

// ── BLoC ──────────────────────────────────────────────────────────────────────

class JournalBloc extends Bloc<JournalEvent, JournalState> {
  JournalBloc({
    required this.getEntries,
    required this.addEntry,
    required this.updateEntry,
    required this.deleteEntry,
  }) : super(const JournalInitial()) {
    on<LoadJournalEntries>(_onLoad);
    on<LoadMonthEntries>(_onLoadMonth);
    on<AddEntry>(_onAdd);
    on<UpdateEntry>(_onUpdate);
    on<DeleteEntry>(_onDelete);
    on<ChangeMonth>(_onChangeMonth);
  }

  final GetJournalEntries getEntries;
  final AddJournalEntry addEntry;
  final UpdateJournalEntry updateEntry;
  final DeleteJournalEntry deleteEntry;
  final _uuid = const Uuid();

  Future<void> _onLoad(
      LoadJournalEntries event, Emitter<JournalState> emit) async {
    emit(const JournalLoading());
    try {
      final now = DateTime.now();
      final entries = await getEntries.forMonth(now.year, now.month);
      final moodSummary = await getEntries.moodSummary();
      final avg = _calcAverage(entries);

      emit(JournalLoaded(
        entries: entries,
        displayYear: now.year,
        displayMonth: now.month,
        moodSummary: moodSummary,
        weeklyAverage: avg,
      ));
    } catch (e) {
      emit(JournalError(e.toString()));
    }
  }

  Future<void> _onLoadMonth(
      LoadMonthEntries event, Emitter<JournalState> emit) async {
    final current = state;
    try {
      final entries = await getEntries.forMonth(event.year, event.month);
      final moodSummary = await getEntries.moodSummary();
      final avg = _calcAverage(entries);

      emit(JournalLoaded(
        entries: entries,
        displayYear: event.year,
        displayMonth: event.month,
        moodSummary: moodSummary,
        weeklyAverage: avg,
      ));
    } catch (e) {
      if (current is JournalLoaded) {
        emit(current); // keep existing state
      } else {
        emit(JournalError(e.toString()));
      }
    }
  }

  Future<void> _onAdd(AddEntry event, Emitter<JournalState> emit) async {
    final current = state;
    if (current is! JournalLoaded) return;

    final entry = JournalEntry(
      id: _uuid.v4(),
      mood: event.mood,
      date: DateTime.now(),
      note: event.note,
      tags: event.tags,
    );

    try {
      await addEntry(entry);
      // Reload
      add(LoadMonthEntries(
          year: current.displayYear, month: current.displayMonth));
    } catch (e) {
      emit(JournalError(e.toString()));
    }
  }

  Future<void> _onUpdate(UpdateEntry event, Emitter<JournalState> emit) async {
    final current = state;
    if (current is! JournalLoaded) return;

    try {
      await updateEntry(event.entry);
      add(LoadMonthEntries(
          year: current.displayYear, month: current.displayMonth));
    } catch (e) {
      emit(JournalError(e.toString()));
    }
  }

  Future<void> _onDelete(DeleteEntry event, Emitter<JournalState> emit) async {
    final current = state;
    if (current is! JournalLoaded) return;

    try {
      await deleteEntry(event.id);
      add(LoadMonthEntries(
          year: current.displayYear, month: current.displayMonth));
    } catch (e) {
      emit(JournalError(e.toString()));
    }
  }

  Future<void> _onChangeMonth(
      ChangeMonth event, Emitter<JournalState> emit) async {
    add(LoadMonthEntries(year: event.year, month: event.month));
  }

  double? _calcAverage(List<JournalEntry> entries) {
    if (entries.isEmpty) return null;
    final sum = entries.fold<int>(0, (s, e) => s + e.mood.value);
    return sum / entries.length;
  }
}
