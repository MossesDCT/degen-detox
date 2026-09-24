import 'package:sqflite/sqflite.dart';
import '../../../../core/constants/app_strings.dart';
import '../../domain/entities/journal_entry.dart';
import '../models/journal_entry_model.dart';

/// SQLite-based storage for mood journal entries.
class JournalLocalDatasource {
  const JournalLocalDatasource({required this.db});

  final Database db;

  Future<List<JournalEntryModel>> getEntries() async {
    final maps = await db.query(
      AppStrings.tableJournalEntries,
      orderBy: 'date DESC',
    );
    return maps.map((m) => JournalEntryModel.fromMap(m)).toList();
  }

  Future<List<JournalEntryModel>> getEntriesForMonth(
      int year, int month) async {
    final start = DateTime(year, month, 1).toIso8601String();
    final end = DateTime(year, month + 1, 1).toIso8601String();

    final maps = await db.query(
      AppStrings.tableJournalEntries,
      where: 'date >= ? AND date < ?',
      whereArgs: [start, end],
      orderBy: 'date DESC',
    );
    return maps.map((m) => JournalEntryModel.fromMap(m)).toList();
  }

  Future<JournalEntryModel?> getEntryForDate(DateTime date) async {
    final dayStart =
        DateTime(date.year, date.month, date.day).toIso8601String();
    final dayEnd =
        DateTime(date.year, date.month, date.day + 1).toIso8601String();

    final maps = await db.query(
      AppStrings.tableJournalEntries,
      where: 'date >= ? AND date < ?',
      whereArgs: [dayStart, dayEnd],
      limit: 1,
    );

    if (maps.isEmpty) return null;
    return JournalEntryModel.fromMap(maps.first);
  }

  Future<String> insertEntry(JournalEntryModel entry) async {
    await db.insert(
      AppStrings.tableJournalEntries,
      entry.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return entry.id;
  }

  Future<void> updateEntry(JournalEntryModel entry) async {
    await db.update(
      AppStrings.tableJournalEntries,
      entry.toMap(),
      where: 'id = ?',
      whereArgs: [entry.id],
    );
  }

  Future<void> deleteEntry(String id) async {
    await db.delete(
      AppStrings.tableJournalEntries,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<Map<String, int>> getMoodSummaryForWeek() async {
    final weekAgo = DateTime.now().subtract(const Duration(days: 7));
    final maps = await db.query(
      AppStrings.tableJournalEntries,
      where: 'date >= ?',
      whereArgs: [weekAgo.toIso8601String()],
    );
    final entries = maps.map((m) => JournalEntryModel.fromMap(m)).toList();

    final summary = <String, int>{};
    for (final entry in entries) {
      final dateKey =
          '${entry.date.year}-${entry.date.month.toString().padLeft(2, '0')}-${entry.date.day.toString().padLeft(2, '0')}';
      summary[dateKey] = entry.mood.value;
    }
    return summary;
  }
}
